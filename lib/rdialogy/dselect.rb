require File.dirname(__FILE__) + '/filepath_widget'

module RDialogy
  class DSelect < FilePathWidget

# Valid options are:
# * :path - Initial directory to display
# * :width
# * :height
# From the man page:
#
#    The directory-selection dialog displays a text-entry window in which you can type a  directory,  and  above
#    that a windows with directory names.
#
#    Here  filepath  can  be a filepath in which case the directory window will display the contents of the path
#    and the text-entry window will contain the preselected directory.
#
#    Use tab or arrow keys to move between the windows.  Within the directory window, use the up/down arrow keys
#    to  scroll the current selection.  Use the space-bar to copy the current selection into the text-entry window.
#
#    Typing any printable characters switches focus to the text-entry window, entering that character as well as
#    scrolling the directory window to the closest match.
#
#    Use a carriage return or the "OK" button to accept the current value in the text-entry window and exit.

    
    def self.run(options={})
      super options
    end

    private

# Maps to the appropriate dialog argument

    def self.command
      'dselect'
    end
  end
end
