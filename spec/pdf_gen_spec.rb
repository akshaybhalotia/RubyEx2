require 'spec_helper'
require 'shared_example_file_generator'

describe "Formats::PDF Generator" do
  
  describe "::FILE_TYPE" do
    it "has file type PDF" do
      expect(Formats::PDFGenerator::FILE_TYPE).to eq("PDF")
    end
  end

  describe ".write_to_file" do
    let (:data) {{name: 'Akshay', age: 23}}
    let (:path) {Formats::PDFGenerator.write_to_file(data)}
    it_behaves_like "File Generator", Formats::PDFGenerator

    it "gives path of the file it writes to" do
      expect(path).to be_an_instance_of(String)
    end

    it "gives a path which contains relevant file name" do
      expect(path).to match(/Resume.pdf/)
    end
  end
end
