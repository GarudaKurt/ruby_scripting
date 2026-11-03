#!/usr/bin/env ruby
# frozen_string_literal: true

# Ultra Lotto 6/58 number generator - "closest to past results" version
#
# How it works:
#   1. Every number 1-58 gets a weight based on how close it is to the numbers
#      drawn in the past 10 days (PCSO draws, Oct 11 - Oct 20, 2026).
#      Numbers that were drawn, or sit right next to drawn numbers, score high.
#   2. Draw position matters: slot 1 of a ticket leans toward what slot 1 looked
#      like in past draws, slot 2 toward slot 2, and so on (draw order, NOT sorted).
#   3. Many candidate tickets are generated, scored by their "average gap" to the
#      past results, and the closest ones are kept.
#
# NOTE: Every draw is independent. This is just for fun - it does not
# improve your odds of winning (1 in 40,475,358).
#
# Usage:
#   ruby ultra_lotto.rb          # generate 4 tickets (default)
#   ruby ultra_lotto.rb 6        # generate 6 tickets

PICK_COUNT      = 6
DEFAULT_TICKETS = 4
MAX_NUMBER      = 58
CANDIDATES      = 500  # candidate tickets generated before keeping the closest
TOP_POOL        = 25   # closest candidates to choose the final tickets from
SIGMA           = 4.0  # how far "close" reaches (bigger = looser)
OVERALL_SHARE   = 0.5  # weight of overall closeness vs. same-position closeness

RANGES = [
  (1..10), (11..20), (21..30), (31..40), (41..50), (51..58)
].freeze

# Past 10 days of Ultra Lotto 6/58 results, in the order they were drawn
PAST_DRAWS = {
  '2026-10-11' => [37, 33, 14, 6, 35, 41],
  '2026-10-13' => [35, 49, 26, 12, 10, 57],
  '2026-10-16' => [21, 12, 30, 4, 36, 41],
  '2026-10-18' => [54, 19, 52, 35, 17, 24],
  '2026-10-20' => [56, 45, 52, 54, 39, 32]
}.freeze

ALL_PAST = PAST_DRAWS.values.flatten.freeze

# Bell-curve closeness: 1.0 when equal, fading as the gap grows
def closeness(a, b)
  Math.exp(-((a - b)**2) / (2 * SIGMA**2))
end

# Weight of each number for a given slot (0..5) of the ticket
def slot_weights(slot)
  same_slot = PAST_DRAWS.values.map { |draw| draw[slot] }

  (1..MAX_NUMBER).to_h do |n|
    positional = same_slot.sum { |d| closeness(n, d) }
    overall    = ALL_PAST.sum { |d| closeness(n, d) } / PICK_COUNT
    [n, positional + OVERALL_SHARE * overall + 0.01]
  end
end

SLOT_WEIGHTS = Array.new(PICK_COUNT) { |slot| slot_weights(slot) }.freeze

def weighted_pick(weights)
  roll = rand * weights.values.sum
  weights.each do |number, weight|
    return number if roll < weight

    roll -= weight
  end
  weights.keys.last
end

# One ticket in draw order (NOT sorted): each slot leans toward past results
def generate_ticket
  taken = []
  PICK_COUNT.times do |slot|
    weights = SLOT_WEIGHTS[slot].reject { |number, _| taken.include?(number) }
    taken << weighted_pick(weights)
  end
  taken
end

# Average gap between each ticket number and the same slot in the nearest past draw.
# Lower = closer to the past 10 days.
def average_gap(ticket)
  gaps = ticket.each_with_index.map do |number, slot|
    PAST_DRAWS.values.map { |draw| (number - draw[slot]).abs }.min
  end
  gaps.sum.to_f / gaps.size
end

def best_tickets(count)
  scored = Array.new(CANDIDATES) { generate_ticket }
                .uniq { |t| t.sort }
                .map { |t| [t, average_gap(t)] }
                .sort_by { |_, gap| gap }

  scored.first([TOP_POOL, count].max).sample(count).sort_by { |_, gap| gap }
end

def show_range_summary
  puts 'Range frequency in past 10 days:'
  RANGES.each do |range|
    count = ALL_PAST.count { |n| range.cover?(n) }
    label = format('%2d-%-2d', range.first, range.last)
    puts "  #{label} | #{'#' * count} (#{count})"
  end

  repeated = ALL_PAST.tally.select { |_, times| times > 1 }.keys.sort
  puts "Repeated numbers: #{repeated.map { |n| format('%02d', n) }.join(', ')}"
  puts
end

tickets = (ARGV.first || DEFAULT_TICKETS).to_i
tickets = DEFAULT_TICKETS if tickets < 1

show_range_summary

puts "Generated #{tickets} ticket(s) (draw order, closest to past results first):"
best_tickets(tickets).each_with_index do |(ticket, gap), i|
  numbers = ticket.map { |n| format('%02d', n) }.join('-')
  puts format('  Ticket %d: %s   (avg gap %.1f)', i + 1, numbers, gap)
end