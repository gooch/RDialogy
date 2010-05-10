require [File.dirname(__FILE__), 'spec_helper'].join '/'

spec_require __FILE__

describe RDialogy::Form do
  describe ".command" do
    it 'should return "form"' do
      RDialogy::Form.command.should == 'form'
    end
  end

    describe ".run" do
    before :each do
      require 'stringio'

      stdout_will_return "Paul\n42"

      @items = [
        ['name', 1, 1, '', 1, 5, 5, 10],
        ['age', 2, 1, '', 2, 5, 5, 10]
      ]
      @expectation = "dialog --form 'hello world' '0' '0' '2' " +
        @items.flatten.map{|e| "'#{e}'" }.join(' ')

      @items.map!{|e| FormField.new(*e)}
    end

    describe "with no :list_height" do
      it "should use the number of _items_ as list height" do
        RDialogy::Form.should_receive(:system).with(/#{@expectation}/)
        RDialogy::Form.run(:text => 'hello world', :items => @items)
      end
    end

    it "should return an hash of the user inputs" do
      args = { :text => 'hello world', :items => @items }
      RDialogy::Form.should_receive(:system).with(/#{@expectation}/)
      RDialogy::Form.run(args).should == {'name' => 'Paul', 'age' => '42' }
    end
  end
end

