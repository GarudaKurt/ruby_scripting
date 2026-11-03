#!/usr/bin/env ruby

def process_logs(filename)
    File.foreach(filename) do |line|
      yield line
    end
end


classify = ->(line) do
# classification

  if line.include?("INFO")
     :info
  elsif line.include?("WARNING")
    :warning
  elsif line.include?("FAIL")
    :failed
  elsif line.include?("PASS")
    :pass
  elsif line.include?("SKIPPED")
    :skip
  elsif line.include?("ERROR")
    :error
  elsif line.include?("Timeout")
    :timeout
  elsif line.include?("Segmentation")
    :segmentation
  end
end


handlers = { 
    info: proc { |line| puts "INFO -> #{line}" },
    warning: proc { |line| puts "WARNING -> #{line}"},
    failed: proc { |line| puts "FAILED  -> #{line}"},
    pass: proc { |line| puts "PASS -> #{line} "},
    skip: proc { |line| puts "SKIPPED -> #{line} "},
    error: proc { |line| puts "ERROR -> #{line} "},
    timeout: proc { |line| puts "Timeout -> #{line} "},
    segmentation: proc { |line| puts "Segmentation -> #{line}"}
}

filename = ARGV[0]
counts = Hash.new(0)
process_logs(filename) do |line| 
    type = classify.call(line)
    counts[type] += 1
    #puts "LINE: #{line}"
    #puts "TYPE: #{type.inspect}"
    handlers[type].call(line)
end


puts "\nSummary:"
counts.each do |type,count|
    puts "#{type}: #{count}"
end

