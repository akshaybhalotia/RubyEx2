require 'spec_helper'
require 'shared_example_file_generator'

describe "Formats::CSV Generator" do
  
  describe "::FILE_TYPE" do
    it "has file type CSV" do
      expect(Formats::CSVGenerator::FILE_TYPE).to eq("Csv")
    end
  end

  describe ".write_to_file" do
    let (:data) {{name: 'Akshay', age: 23}}
    it_behaves_like "File Generator", Formats::CSVGenerator

    it "gives path of the file it writes to" do
      path = Formats::CSVGenerator.write_to_file(data)
      expect(path).to be_an_instance_of(String)
      expect(path).to match(/Resume.csv/)
    end
  end
end
