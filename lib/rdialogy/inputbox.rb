require File.dirname(__FILE__) + '/base'

module RDialogy
  class InputBox < Base
    def self.run options={}
      super options, true
    end    

    def self.command
      'inputbox'
    end

    def self.args(options={})
      base_args = super
      base_args << options[:init] unless options[:init].nil?
      base_args
    end
  end
end
