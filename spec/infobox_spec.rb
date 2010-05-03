require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::InfoBox do
  describe ".command" do
    it "should return infobox" do
      RDialogy::InfoBox.command.should == 'infobox'
    end
  end

  describe ".run" do
    it "should return dialog run string" do
      RDialogy::InfoBox.should_receive(:system).with("dialog --infobox 'hello world' '0' '0'")
      RDialogy::InfoBox.run(:text => 'hello world')
    end
  end
end
