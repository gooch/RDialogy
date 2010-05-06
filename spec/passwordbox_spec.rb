require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::PasswordBox do
  describe ".command" do
    it "should return passwordbox" do
      RDialogy::PasswordBox.command.should == 'passwordbox'
    end
  end

  describe ".run" do
    it "should return the string that is input by the user" do
      require 'stringio'

      data = StringIO.new "sexmachine41"

      tmp = mock('tempfile')
      Tempfile.stub!(:new).and_return(tmp)
      tmp.stub!(:path).and_return('/tmp/tempfile')
      tmp.stub!(:readline).and_return { data.readline }
      tmp.stub!(:close)

      expectation = /--passwordbox 'Enter password'/
      RDialogy::PasswordBox.should_receive(:system).with(expectation)
      RDialogy::PasswordBox.run(:text => "Enter password").should == "sexmachine41"
    end
  end
end
