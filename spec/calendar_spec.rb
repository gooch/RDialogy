require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::Calendar do
  describe ".command" do
    it "should return calendar" do
      RDialogy::Calendar.command.should == 'calendar'
    end
  end

  describe ".run" do
    before :each do
      require 'stringio'

      data = StringIO.new "01/05/2010\n"
      tmp = mock('tempfile')
      Tempfile.stub!(:new).and_return(tmp)
      tmp.stub!(:path).and_return('/tmp/tempfile')
      tmp.stub!(:readline).and_return { data.readline }
      tmp.stub!(:close)

      @expectation = "dialog --calendar 'hello world' '0' '0'"
    end

    describe "with no date arguments" do
      it "should call external dialog" do
        RDialogy::Calendar.should_receive(:system).with(/#{@expectation}/)
        RDialogy::Calendar.run(:text => 'hello world').should == Time.mktime(2010, 5, 1)
      end
    end

    describe "with date arguments" do
      it "should call external dialog with the date arguments after the normal ones" do
        RDialogy::Calendar.should_receive(:system).with(/#{@expectation} '17' '11' '1985'/)
        args = { :text => 'hello world', :year => 1985, :month => 11, :day => 17 }
        RDialogy::Calendar.run(args)
      end
    end
  end
end
