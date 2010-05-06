require File.dirname(__FILE__) + '/base'

module RDialogy
# A password box  is  similar  to  an input box, except that the text the user enters is not displayed.  This is useful when
# prompting for passwords or other sensitive information.
  class PasswordBox < Base
    def self.run(options={})
      super options, true
    end

    def self.command
      'passwordbox'
    end
  end
end
