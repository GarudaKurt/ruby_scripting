#!/usr/bin/env ruby

module LogFormatter
    def format_message(type, message)
        "[#{type.upcase}] #{message}"
    end
end
