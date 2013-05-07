require "spec_helper"

describe Application do
  before :each do
    @application = Application.new(title: "Test", abr: "12345") 
  end
  
  describe "#new" do
    it "should have title set" do
      expect(FactoryGirl.build(:application, title: nil)).to_not be_valid
    end
    
    it "should have abr set" do 
      expect(FactoryGirl.build(:application, abr: nil)).to_not be_valid
    end
  end
  
  describe "#title" do
    it "should return the title" do
      expect(@application.title).to eq("Test")
    end
  end
  
  describe "#abr" do
    it "should return the abr" do
      expect(@application.abr).to eq("12345")
    end
  end
end