$LOAD_PATH << File.dirname(__FILE__)+'/../lib/rdialogy'

def spec_require(file)
	#puts $LOAD_PATH.inspect
	require file.scan(/.*\/(.*)_spec.rb/).flatten.first
end

def stdout_will_return(string)
    require 'stringio'

    data = StringIO.new "#{string}\n"
    tmp = mock('tempfile')
    Tempfile.stub!(:new).and_return(tmp)
    tmp.stub!(:path).and_return('/tmp/tempfile')
    tmp.stub!(:readline).and_return { data.readline }
    tmp.stub!(:close)
end

