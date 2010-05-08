require File.dirname(__FILE__) + '/base'

module RDialogy
# The YesNo widget presents a message to the user and
# two options "yes" and "no" and
# returns boolean
  class YesNo < Base
    private
    def self.command
      'yesno'
    end
  end
end

