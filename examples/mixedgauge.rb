require [File.dirname(__FILE__), '..', 'lib', 'rdialogy'].join('/')

include RDialogy


@p = 0
@all_tasks = [
  'Updating the master baffle record',
  'Inverting the Ukraine tupple',
  'Restoring the donkey\'s fire mode'
]

@processed = []
 
@all_tasks.each do |tag|
  this_item = MenuItem.new(tag, 'OK')
  @processed << this_item
  progress = (@processed.count / @all_tasks.count.to_f) * 100
  MixedGauge.run(:text => "Working", :percent => progress, :items => @processed)
  sleep 1
end
