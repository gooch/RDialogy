require File.dirname(__FILE__) + '/base'

module RDialogy
  class MessageBox < Base
    private
    def self.command
      'msgbox'
    end   
  end
end
