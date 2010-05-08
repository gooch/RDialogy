require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::Checklist do
  describe ".command" do
    it "should return checklist" do
      RDialogy::Checklist.command.should == 'checklist'
    end
  end

  describe ".run" do
    before :each do
      require 'stringio'

      stdout_will_return '"bread" "milk"'

      @items = %w(bread milk cheese).map{|e| MenuItem.new(e, e)}
      @expectation = "dialog --checklist 'hello world' '0' '0' '3'"
    end

    describe "with no :list_height" do
      it "should use the number of _items_ as list height" do
        RDialogy::Checklist.should_receive(:system).with(/#{@expectation}/)
        RDialogy::Checklist.run(:text => 'hello world', :items => @items)
      end
    end

    it "should return an array of the selected tags" do
      args = { :text => 'hello world', :items => @items }
      RDialogy::Checklist.should_receive(:system).with(/#{@expectation}/)
      RDialogy::Checklist.run(args).should == ['bread', 'milk']
    end
  end
end

