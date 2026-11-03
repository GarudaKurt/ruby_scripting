#!/usr/bin/env ruby

require "forwardable"

class LogFile
    extend Forwardable
    def_delegators :@lines, :size, :each, :select, :first, :last

    def initialize(path)
      @lines = File.readlines(path)
    end

    def errors
      @lines.select { |var| var.include?("ERROR") }
    end

    def warnings
        @lines.select { |var| var.include?("WARNING") }
    end

    def segmentation
      @lines.select { |var| var.include?("Segmentation") }
    end
    def skipped
      @lines.select { |var| var.include?("SKIPPED") }
    end
end

log = LogFile.new("summary.log")
puts "Total lines: #{log.size}"
puts "Errors found: #{log.errors.size}"
puts "Warning found: #{log.warnings.size}"
puts "Segmentation fault found: #{log.segmentation.size}"
puts "Skipped found: #{log.skipped.size}"
