require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy

puts PasswordBox.run(:text => "Enter password")

