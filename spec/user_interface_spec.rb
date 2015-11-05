require 'spec_helper'

describe UserInterface do

  let(:ui) { UserInterface.new }
  
  describe "#welcome" do
    it "shows welcome message" do
      expect{ui.welcome}.to output(/[W|w]elcome/).to_stdout
    end
  end

  describe "#display_list" do
    it "displays a list of file formats available" do
      expect{ui.display_list(%w[Pdf csv])}.to output("1. PDF\n2. CSV\n").to_stdout
    end
    
    it "displays relevant message when no formats available" do
      expect{ui.display_list([])}.to output("No formats available\n").to_stdout
    end
  end

  describe "#choice" do
    it "has choice" do
      expect(ui).to respond_to(:choice)
    end
  end

  describe "#get_data" do
    let(:list) {[:name, :age]}
    
    it "has same output keys as given" do
      allow(ui).to receive(:gets).and_return("Test\n12")
      expect(ui.get_data(list).keys).to eq(list)
    end

    it "accepts data from user" do
      allow(ui).to receive(:gets).and_return("Test\n12")
      expect(ui.get_data(list)).to be_a_instance_of(Hash)
    end
  end
end
