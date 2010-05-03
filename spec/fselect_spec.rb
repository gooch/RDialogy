require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::FSelect do
  describe ".command" do
    it "should return 'fselect'" do
      RDialogy::FSelect.command.should == 'fselect'
    end
  end
end
