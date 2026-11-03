#!/usr/bin/env ruby

require "open3"

results = `ls -la`
puts results

date = `date`
puts date.chomp


output = `ls /noexistent_folder`
puts output

if $?.success?
  puts "Command successded"
else
  puts "Commands failed with exit code #{$?.exitstatus}"
end


stdout, stderr, status = Open3.capture3("ls -la /tmp")

puts "STDOUT: #{stdout}"
puts "STDERR: #{stderr}"
puts "Exit code: #{status.exitstatus}"
puts "Success? #{status.success?}"

stdout, stderr, status = Open3.capture3("ls /noexistent_folder")

if status.success?
  puts "Files:\n#{stdout}"
else
  puts "Error occurred: #{stderr.strip}"
end
