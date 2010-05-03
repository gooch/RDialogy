require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::Menu do
  describe ".command" do
    it "should return menu" do
      RDialogy::Menu.command.should == 'menu'
    end
  end

  describe ".run" do
    before :each do
      require 'stringio'

      data = StringIO.new 'bread' + "\n"

      tmp = mock('tempfile')
      Tempfile.stub!(:new).and_return(tmp)
      tmp.stub!(:path).and_return('/tmp/tempfile')
      tmp.stub!(:readline).and_return { data.readline }
      tmp.stub!(:close)

      @items = %w(bread milk cheese).map{|e| MenuItem.new(e, e)}
      @expectation = "dialog --menu 'hello world' '0' '0' '3'"
    end

    describe "with no :list_height" do
      it "should use the number of _items_ as list height" do
        RDialogy::Menu.should_receive(:system).with(/#{@expectation}/)
        RDialogy::Menu.run(:text => 'hello world', :items => @items)
      end
    end

    it "should return a string that is the tag of the selected item" do
      args = { :text => 'hello world', :items => @items }
      RDialogy::Menu.should_receive(:system).with(/#{@expectation}/)
      RDialogy::Menu.run(args).should == 'bread'
    end
  end
end
