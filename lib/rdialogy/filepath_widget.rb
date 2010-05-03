require File.dirname(__FILE__) + '/base'

module RDialogy
  class FilePathWidget < Base
# Valid options are:
# * :path - Initial directory to display
# * :width
# * :height

    def self.run(options={})
      super options, true
    end

    private

# Maps the options hash to an ordered list, valid options are:
# * :path
# * :width
# * :height

    def self.args(options={})
      options[:path] ||= Dir.pwd
      options[:width] ||= 0
      options[:height] ||= 0

      [:path, :height, :width].map{|e| options[e]}
    end
  end
end

