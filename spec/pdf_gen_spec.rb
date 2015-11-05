require 'spec_helper'
require 'shared_example_file_generator'

describe "PDF Generator" do
  
  describe "::FILE_TYPE" do
    it "has file type PDF" do
      expect(PDFGenerator::FILE_TYPE).to eq("PDF")
    end
  end

  describe ".write_to_file" do
    let (:data) {{name: 'Akshay', age: 23}}
    it_behaves_like "File Generator", PDFGenerator

    it "gives path of the file it writes to" do
      path = PDFGenerator.write_to_file(data)
      expect(path).to be_an_instance_of(String)
      expect(path).to match(/Resume.pdf/)
    end
  end
end
