#!/usr/bin/env ruby

require "pathname"

log_dir = Pathname.new(ARGV[0] || "logs")

unless log_dir.exist?
  puts "Error: directory '#{log_dir}' not found."
  exit 1
end

total_lines = 0

Dir.glob("#{log_dir}/*.log").each do |filepath|
  lines = File.readlines(filepath).length
  puts "#{File.basename(filepath)}: #{lines} lines"
  total_lines += lines
end

puts "-" * 20
puts "Total lines accross all logs: #{total_lines}"
