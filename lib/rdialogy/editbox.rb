require File.dirname(__FILE__) + '/filepath_widget'

module RDialogy
  class Editbox < FilePathWidget

# Valid options are:
# * :path - Path to file to display
# * :width
# * :height
#
#  From the man page:
#
#  The  edit-box  dialog  displays a copy of the file.  You may edit it using the backspace, delete and cursor
#  keys to correct typing errors.  It also recognizes pageup/pagedown.  Unlike the --inputbox, you must tab to
#  the  "OK"  or "Cancel" buttons to close the dialog.  Pressing the "Enter" key within the box will split the
#  corresponding line.

    def self.run(options={})
      super options
    end

    private

# Maps to the dialog argument

    def self.command
      'editbox'
    end
  end
end

