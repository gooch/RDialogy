require File.dirname(__FILE__) + '/base'

module RDialogy
  class Gauge < Base
# Valid options are:
# * :text
# * :width
# * :height
# * :percent - initial percentage, default 0
#
# From the man page:
#    A  gauge  box displays a meter along the bottom of the box.  The
#    meter indicates the percentage.
# New percentages are  read by calling
# .update(new percentage) inside the block supplied to run().
# Calling .set_prompt(percentage, new_prompt) inside the block sets
# a new prompt on the progress bar.

    def self.run(options={})
      begin
        fifo = "/tmp/dialog_gauge.#{$$}"
        system "mkfifo #{fifo}"
        system "( #{dialog_string options} < #{fifo} ) &"
        @@fifo = File.open fifo, 'w'
        yield self
      ensure
        @@fifo.close
        @@fifo = nil
        system "rm #{fifo}"
      end
    end

    def self.command
      'gauge'
    end

# sends the new percentage to the running gauge

    def self.update(percentage)
      raise "Can't update gauge as it is not running." if @@fifo.nil?
      @@fifo.puts percentage.to_i
      @@fifo.flush
    end

# sends the percentage to the running gauge and sets a new prompt

    def self.set_prompt(percentage, new_prompt)
      raise "Can't update gauge as it is not running." if @@fifo.nil?
      @@fifo.puts "XXX"
      @@fifo.puts percentage.to_i
      @@fifo.puts new_prompt
      @@fifo.puts "XXX"
      @@fifo.flush
    end
  end
end
