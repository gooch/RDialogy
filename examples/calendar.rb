require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy

puts Calendar.run(:text => "Choose a date!", :month => 11, :day => 17)
