require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::PasswordBox do
  describe ".command" do
    it "should return passwordbox" do
      RDialogy::PasswordBox.command.should == 'passwordbox'
    end
  end

  describe ".run" do
    before :each do
        stdout_will_return "sexmachine41"
    end

    it "should return the string that is input by the user" do
      expectation = /--passwordbox 'Enter password'/
      RDialogy::PasswordBox.should_receive(:system).with(expectation)
      RDialogy::PasswordBox.run(:text => "Enter password").should == "sexmachine41"
    end
  end
end

