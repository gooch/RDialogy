require File.dirname(__FILE__) + '/base'

module RDialogy
  class InputBox < Base
    private
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
