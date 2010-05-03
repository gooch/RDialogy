require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::InputBox do
  describe ".command" do
    it "should return inputbox" do
      RDialogy::InputBox.command.should == 'inputbox'
    end
  end

  describe ".args" do
    before :each do
      @args = { :text => "Hello", :height => 4, :width => 5 }
    end

    describe "when :init is not an option" do
      it "should call dialog with base args only" do
        RDialogy::InputBox.args(@args).should == ['Hello', 4, 5]
      end
    end

    describe "when :init is an option" do
      it "should call dialog with base args + the value of init" do
        @args[:init] = "Catfish"
        RDialogy::InputBox.args(@args).should == ['Hello', 4, 5, 'Catfish']
      end
    end
  end
end
