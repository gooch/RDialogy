require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy

puts Checklist.run(
  :text => "Select some stuff!",
  :items => %w(grapes lemons tomatos).map{|e| MenuItem.new(e, e)}
).inspect
