require 'tempfile'

module RDialogy
  class Base

# assembles the arguments for dialog and executes them,
# if std_err is true STDERR is captured and returned, optionally formatted
# by supplied block.

    def self.run(options={}, std_err = false)
      cmd = dialog_string options

      if std_err
        begin
          tmp = Tempfile.new('tmp')
          cmd += ' 2> ' + tmp.path
        
          system cmd

          output = String.new
          while true
            output += tmp.readline
          end
        rescue EOFError
          if block_given?
            return yield output
          else
            return output
          end
        ensure
          tmp.close
        end
      else
        system cmd
      end
    end

    private
# Template method to be overloaded in child classes

    def self.command
      raise "Template method called, must overload command in child class"
    end

# expands the options out into the full dialog command string

    def self.dialog_string(options={})
      (['dialog', '--' + command] + add_quotes(args(options))).join ' '
    end
# Returns a correctly ordered list from the input hash,
# also provides defaults for elements that are not supplied

    def self.args(options={})
      options[:text] ||= 'default title'
      options[:height] ||= 0
      options[:width] ||=0

      [:text, :height, :width].map { |e| options[e] }
    end

# Adds single quotes around all of the elements in the array returned by _args_

    def self.add_quotes(args)
      args.map{|e| "'#{e.to_s.gsub(/'/, "'\\\\''")}'"}
    end
  end
end
