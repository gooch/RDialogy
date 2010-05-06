require File.dirname(__FILE__) + '/base'
require File.dirname(__FILE__) + '/menu_item'

#    A mixedgauge box displays a meter along the bottom of the box.  The meter indicates the percentage.
#    It also displays a list of the tag- and item-values at the top of the box.
#    The text is shown as a caption between the list and meter.  The :percent value denotes the initial percentage shown in the
#    meter.
#    MixedGauge does not provide any method for updating the percentage in a single instance as Gauge does
#    The widget accepts no input and returns true.

module RDialogy

  class MixedGauge < Base
# Valid options:
# * :text,
# * :width,
# * :height,
# * :percent - The percentage progress indicated by the gauge.
# * :items - An array of MenuItem objects

    def self.args(options={})
      options[:percent] ||= 0
      options[:items] ||= []
      super + [options[:percent].to_i] + options[:items].map{|e| [e.tag, e.item] }.flatten
    end

    def self.command
      'mixedgauge'
    end
  end
end

