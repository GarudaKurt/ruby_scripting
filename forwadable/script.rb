#!/usr/bin/env ruby

require "forwardable"
require "open3"

class ProcessList
    extend Forwardable
    def_delegators :@processes, :size, :each, :select, :first, :map

    def initialize
        stdout, _, _ = Open3.capture3("ps aux")
        @processes = stdout.lines.drop(1)
    end

    def high_memory(threshold = 5.0)
      @processes.select { |line| line.split[3].to_f > threshold }
    end
end

procs = ProcessList.new
puts "Total processes: #{procs.size}"
procs.high_memory(10).each { |p| puts p}

