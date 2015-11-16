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

  describe "#has_required_methods?" do
    it "checks if given class has required methods to be a file format" do
      expect(file_formatter.has_required_methods?(Formats::CSVGenerator)).to be true
    end
  end
  
  describe "#output_file" do
    let (:data) {{name: 'Akshay', age: 23}}
    let (:path) {file_formatter.output_file(data, 2)}
    
    it "gives path of the newly written file based on choice" do
      expect(path).to be_an_instance_of(String)
    end

    it "gives a path that always contains 'Resume'" do
      expect(path).to match(/Resume/)
    end
  end
end
