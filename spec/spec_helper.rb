$LOAD_PATH << File.dirname(__FILE__)+'/../lib/rdialogy'

def spec_require(file)
	#puts $LOAD_PATH.inspect
	require file.scan(/.*\/(.*)_spec.rb/).flatten.first
end
