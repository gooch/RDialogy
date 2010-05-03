require File.dirname(__FILE__) + '/base'
require File.dirname(__FILE__) + '/menu_item'

module RDialogy
  class Checklist < Base

# Valid options are:
# * :text - Title of the widget
# * :width
# * :height
# * :list_height - Number of items to display in the list
# * :items - Array of MenuItem
#
# Returns <b>Array</b>
#
# From the man page:
#
#    A checklist box is similar to a menu box; there are multiple entries presented  in  the  form  of  a  menu.
#    Instead  of choosing one entry among the entries, each entry can be turned on or off by the user.  The initial
#    on/off state of each entry is specified by status.


    def self.run(options={})
      super options, true do |input|
        items = input.split(' ')
        items.map{|e| e.scan(/^"(.*)"$/).flatten.first }
      end
    end

    private

# Formats the hash into an ordered list, valid options are:
# * :text - Title of the widget
# * :width
# * :height
# * :list_height - Number of items to display in the list
# * :items - Array of MenuItem

    def self.args(options={})
      options[:items] ||= []
      options[:list_height] ||= options[:items].count

      options[:items].map! do |item|
        [item.tag, item.item, item.status ? 'on' : 'off']
      end

      super + [options[:list_height]] + options[:items].flatten
    end

# Maps to the appropriate dialog argument
    def self.command
      'checklist'
    end

  end
end
