require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy

puts Form.run(:text => "Enter some details", 
  :items => 
    [
      FormField.new('name', 1, 1, '', 1, 5, 10, 10),
      FormField.new('age', 2, 1, '', 2, 5, 10, 10)
    ]
).inspect
