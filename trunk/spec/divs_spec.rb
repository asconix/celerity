require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Divs" do
  before :all do
    @ie = IE.new
    add_spec_checker(@ie)    
  end

  before :each do
    @ie.goto(TEST_HOST + "/non_control_elements.html")
  end
  
  describe "#length" do
    it "should return the number of divs" do
      @ie.divs.length.should == 6
    end
  end
  
  describe "#[]" do
    it "should return the div at the given index" do
      @ie.divs[2].id.should == "outer_container"
    end
  end

  describe "#each" do
    it "should iterate through divs correctly" do
      @ie.divs.each_with_index do |d, index|
        d.name.should == @ie.div(:index, index+1).name
        d.id.should == @ie.div(:index, index+1).id
        d.class_name.should == @ie.div(:index, index+1).class_name
      end
    end
  end
  
  after :all do
    @ie.close
  end

end
