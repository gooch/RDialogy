require File.dirname(__FILE__) + '/base'

module RDialogy
  class Calendar < Base

#    Valid options are:
# *   :text - Title of widget
# *   :width
# *   :height
# *   :year
# *   :month
# *   :day
#
#    From the dialog man page:
#    A calendar box displays month, day and year in separately adjustable windows.  If the values for day, month
#    or  year  are  missing or negative, the current date's corresponding values are used.  You can increment or
#    decrement any of those using the left-, up-, right- and down-arrows.  Use vi-style h, j, k and l for moving
#    around  the array of days in a month.  Use tab or backtab to move between windows.  If the year is given as
#    zero, the current date is used as an initial value.
#    On exit, the date is printed in the form day/month/year.


    def self.run(options={})
      super options, true do |input|
        Time.mktime *input.chomp.split('/').reverse
      end
    end

    private

    def self.args(options={})
      options[:year] ||= -1
      options[:month] ||= -1
      options[:day] ||= -1

      super + [:day, :month, :year].map{|e| options[e]}
    end

# Maps to the appropriate dialog argument

    def self.command
      'calendar'
    end

  end
end
