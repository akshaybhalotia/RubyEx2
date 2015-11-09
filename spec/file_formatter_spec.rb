require 'spec_helper'

describe FileFormatter do

  let (:file_formatter) {FileFormatter.new}

  describe "#get_formats" do
    context "when no formats" do
      xit "gives empty list" do
        expect(file_formatter.get_formats).to eq([])
      end
    end
    
    context "when csv available" do
      it "gives list containing csv" do
        expect(file_formatter.get_formats).to include("csv".upcase)
      end
    end
  end
  
  describe "#output_file" do
    let (:data) {{name: 'Akshay', age: 23}}
    it "writes to file based on choice" do
      path = file_formatter.output_file(data, 2)
      expect(path).to be_an_instance_of(String)
      expect(path).to match(/Resume/)
    end
  end
end
