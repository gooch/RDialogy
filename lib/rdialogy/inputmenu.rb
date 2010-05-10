require File.dirname(__FILE__) + '/base'
require File.dirname(__FILE__) + '/menu_item'

module RDialogy
  class InputMenu < Base

    def self.run(options={})
      super options, true do |input|
        if input =~ /^RENAMED/
          input.split(' ')[1..-1]
        else
          input.chomp
        end
      end
    end

# Formats the hash into an ordered list, valid options are:
# * :text - Title of the widget
# * :width
# * :height
# * :list_height - Number of items to display in the list
# * :items - Array of MenuItem

    def self.args(options={})
      options[:items] ||= []
      options[:list_height] ||= options[:items].count * 3

      options[:items].map! do |item|
        [item.tag, item.item]
      end

      super + [options[:list_height]] + options[:items].flatten
    end

# Maps to the appropriate dialog argument
    def self.command
      'inputmenu'
    end

  end
end

