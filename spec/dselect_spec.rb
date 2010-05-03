require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::DSelect do
  describe ".command" do
    it "should return 'dselect'" do
      RDialogy::DSelect.command.should == 'dselect'
    end
  end

  describe ".run" do
    before :each do
      require 'stringio'

      data = StringIO.new '/var/www/Eliza_Dushku'

      tmp = mock('tempfile')
      Tempfile.stub!(:new).and_return(tmp)
      tmp.stub!(:path).and_return('/tmp/tempfile')
      tmp.stub!(:readline).and_return { data.readline }
      tmp.stub!(:close)

      @expectation = "dialog --dselect '/var/www' '0' '0'"
    end

    it "should use :path as the first argument" do
      RDialogy::DSelect.should_receive(:system).with(/#{@expectation}/)
      RDialogy::DSelect.run(:path => '/var/www')
    end

    it "should return a string" do
      args = { :path => '/var/www' }
      RDialogy::DSelect.should_receive(:system).with(/#{@expectation}/)
      RDialogy::DSelect.run(args).should == '/var/www/Eliza_Dushku'
    end
  end
end
