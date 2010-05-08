require [File.dirname(__FILE__), 'spec_helper'].join '/'
require 'stringio'

spec_require __FILE__

describe RDialogy::InputMenu do
  describe ".command" do
    it "should return inputmenu" do
      RDialogy::InputMenu.command.should == 'inputmenu'
    end
  end

  describe ".run" do
    before :each do
      @items = %w(grapes bread milk cheese).map{|e| MenuItem.new(e, e)}
      RDialogy::InputMenu.stub!(:system)
    end

    describe "when the user doesn't rename an object" do
      it "should return the tag of the object as a string" do
        stdout_will_return "grapes"
        RDialogy::InputMenu.run(:text => 'hello world', :items => @items).should == 'grapes'
      end
    end

    describe "when the user does rename an object" do
      it "should return an array containing the tag and the new value" do
        stdout_will_return "RENAMED grapes sultanas"
        RDialogy::InputMenu.run(:text => 'hi', :items => @items).should == ['grapes', 'sultanas']
      end
    end
  end

  describe ".args" do
    before :each do
      @items = %w(grapes bread milk cheese).map{|e| MenuItem.new(e, e)}
      @args = {:text => "hello world", :items => @items }
    end

    describe "list height" do
      it "should be 3 times the number of list elements" do
        RDialogy::InputMenu.args(@args)[3].should == 12
      end
    end
  end
end

