require 'pry'

class Logger
  def initialize
    @messages = {}
  end

  def should_print_message(timestamp, message)
    if !@messages[message]
      @messages[message] = timestamp + 10
      return true
    else
      timestamp > @messages[message]
    end
  end
end

