class Rdialogy
  VERSION = '1.0.0'
end

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'rdialogy/base'
require 'rdialogy/message_box'
require 'rdialogy/calendar'
require 'rdialogy/checklist'
require 'rdialogy/dselect'
require 'rdialogy/editbox'
require 'rdialogy/form'
require 'rdialogy/gauge'
require 'rdialogy/inputbox'
require 'rdialogy/inputmenu'
require 'rdialogy/infobox'
require 'rdialogy/fselect'
require 'rdialogy/menu'
require 'rdialogy/mixedgauge'
require 'rdialogy/passwordbox'
require 'rdialogy/yesno'

