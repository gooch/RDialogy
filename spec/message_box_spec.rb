require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::MessageBox do
  describe ".command" do
    it "should return msgbox" do
      RDialogy::MessageBox.command.should == 'msgbox'
    end
  end

  describe ".run" do
    it "should return dialog run string" do
      RDialogy::MessageBox.should_receive(:system).with("dialog --msgbox 'hello world' '0' '0'")
      RDialogy::MessageBox.run(:text => 'hello world')
    end
  end
end
