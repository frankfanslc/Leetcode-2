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
      if timestamp >= @messages[message]
        @messages[message] = timestamp + 10
        return true
      else
        return false
      end
    end
  end
end

