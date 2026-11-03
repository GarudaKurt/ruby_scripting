#!/usr/bin/env ruby


require "pathname"

log_dir = Pathname.new(ARGV[0] || ".")

unless log_dir.exist?
   puts "Error: directory '#{log_dir}' not found."
   exit 1
end

total_lines = 0
level_counts = Hash.new(0)

levels_to_track = %w[FAIL INFO WARNING]

Dir.glob("#{log_dir}/*.log").each do |filepath|
    lines = File.readlines(filepath)
    total_lines += lines.length

    lines.each do |line|
      levels_to_track.each do |level|
        level_counts[level] += 1 if line.include?(level)

      end
    end
   puts "#{File.basename(filepath)}: #{lines.length} lines"
end

puts "-" * 20
puts "Total lines accross all logs: #{total_lines}"

level_counts.each do |level, count|
  puts "#{level}: #{count}"
end
