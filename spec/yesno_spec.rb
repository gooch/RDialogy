require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::YesNo do
  describe ".command" do
    it "should return msgbox" do
      RDialogy::YesNo.command.should == 'yesno'
    end
  end

  describe ".run" do
    it "should return dialog run string" do
      RDialogy::YesNo.should_receive(:system).with("dialog --yesno 'hello world' '0' '0'")
      RDialogy::YesNo.run(:text => 'hello world')
    end
  end
end

