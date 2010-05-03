require File.dirname(__FILE__) + '/base'
require File.dirname(__FILE__) + '/form_field'

module RDialogy
  class Form < Base
# Valid options are:
# * :text - Title of the widget
# * :width
# * :height
# * :form_height - Number of items to display in the list
# * :items - Array of FormField
#
# Returns <b>Hash</b>
#
# From the man page
#
#  The form dialog displays a form consisting of labels and fields, which are positioned on a scrollable  window 
#  by  coordinates  given  in  the script.  The field length flen and input-length ilen tell how long the
#  field can be.  The former defines the length shown for a selected field, while the latter defines the  per‐
#  missible length of the data entered in the field.
#
#  -  If flen is zero, the corresponding field cannot be altered.  and the contents of the field determine the
#     displayed-length.
#
#  -  If flen is negative, the corresponding field cannot be altered, and the negated value of flen is used as
#     the displayed-length.
#
#  -  If ilen is zero, it is set to flen.
#
#  Use up/down arrows (or control/N, control/P) to move between fields.  Use tab to move between windows.

    def self.run(options={})
        keys = options[:items].map(&:label_text)
      super options, true do |input|
        result = Hash.new
        input.split("\n").each do |item|
          result[keys.shift] = item
        end
        result
      end
    end

    private
    
    def self.args(options={})
      options[:items] ||= []
      options[:form_height] ||= options[:items].count
      options[:items].map! do |item|
        [
          :label_text, :label_x, :label_y,
          :item_text, :item_x, :item_y,
          :label_length, :item_length
        ].map do |m|
          item.send(m)
        end
      end

      super + [options[:form_height]] + options[:items].flatten
    end
     

# Maps to the appropriate dialog argument
    def self.command
      'form'
    end
  end
end
