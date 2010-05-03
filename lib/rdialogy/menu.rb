require File.dirname(__FILE__) + '/base'
require File.dirname(__FILE__) + '/menu_item'

module RDialogy
  class Menu < Base
    def self.run(options={})
      super options, true do |input|
        input.chomp
      end
    end

    def self.command
      'menu'
    end

    def self.args(options={})
      options[:items] ||= []
      options[:list_height] ||= options[:items].count
      super + [options[:list_height]] + options[:items].map{|e| [e.tag, e.item] }.flatten
    end
  end
end
