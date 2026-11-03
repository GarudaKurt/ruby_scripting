#!/usr/bin/env ruby

require_relative "logger"

class Logger
    include LogFormatter

    def log(type, message)
        puts format_message(type,message)
    end
end

logger = Logger.new
logger.log("error", "Data connection failed")

class Report
    include LogFormatter

    def generate
        puts format_message("report", "Daily report generated")
    end
end
report = Report.new
report.generate
