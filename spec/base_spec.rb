require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::Base do
  describe ".command" do
    it "should raise an error" do
      lambda { RDialogy::Base.command }.should raise_error
    end
  end

  describe ".args" do
    describe "without any options supplied" do
      it "should return an array of defaults" do
        RDialogy::Base.args.should == ['default title', 0, 0]
      end
    end
  end

  describe ".add_quotes" do
    it "should return quoted strings" do
      RDialogy::Base.send(:add_quotes, [1, 2]).should == ["'1'", "'2'"]
    end

    it "should escape single quotes inside the strings" do
      RDialogy::Base.send(:add_quotes, ["Kitten's feet"]).should == ["'Kitten'\\''s feet'"]
    end
  end
end

