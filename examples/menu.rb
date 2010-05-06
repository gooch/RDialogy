require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy

puts Menu.run(
  :text => "Select a thing",
  :items => %w(grapes lemons tomatos).map{|e| MenuItem.new(e, e)}
).inspect

