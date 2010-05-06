require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy

Gauge.run(:text => "Hi!", :width => 90) do |progress|
  0.upto(50).each do |p|
    progress.update p
    sleep 0.01
  end
  
  progress.set_prompt(51, "Updating some other thing..")

  51.upto(100).each do |p|
    progress.update p
    sleep 0.02
  end
end
