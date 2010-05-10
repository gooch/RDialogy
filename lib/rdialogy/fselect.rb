require File.dirname(__FILE__) + '/filepath_widget'

module RDialogy
# From dialog(1)
#    The fselect (file-selection) dialog displays a text-entry window in which you can type a filename (or
#    directory), and above that two windows with directory names and filenames. Here filepath can be a filepath
#    in which case the file and directory windows will display the contents of the path and the text-entry window
#    will contain the preselected filename. Use tab or arrow keys to move between the windows. Within the
#    directory or filename windows, use the up/down arrow keys to scroll the current selection. Use the space-bar
#    to copy the current selection into the text-entry window. Typing any printable characters switches focus to
#    the text-entry window, entering that character as well as scrolling the directory and filename windows to the
#    closest match. Typing the space character forces dialog to complete the current name (up to the point where
#    there may be a match against more than one entry). Use a carriage return or the "OK" button to accept the
#    current value in the text-entry window and exit.
  class FSelect < FilePathWidget

    def self.run(options={}); super options; end

    def self.command
      'fselect'
    end
  end
end

