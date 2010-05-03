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
    def stub_tempfile(value)
      data = StringIO.new value

      tmp = mock('tempfile')
      Tempfile.stub!(:new).and_return(tmp)
      tmp.stub!(:path).and_return('/tmp/tempfile')
      tmp.stub!(:readline).and_return { data.readline }
      tmp.stub!(:close)
    end

    before :each do
      @items = %w(grapes bread milk cheese).map{|e| MenuItem.new(e, e)}
      RDialogy::InputMenu.stub!(:system)
    end

    describe "when the user doesn't rename an object" do
      it "should return the tag of the object as a string" do
        stub_tempfile "grapes\n"
        RDialogy::InputMenu.run(:text => 'hello world', :items => @items).should == 'grapes'
      end
    end

    describe "when the user does rename an object" do
      it "should return an array containing the tag and the new value" do
        stub_tempfile "RENAMED grapes sultanas\n"
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
