require 'spec_helper'
require 'shared_example_file_generator'

describe "Formats::CSV Generator" do

  it_behaves_like "File Generator", Formats::CSVGenerator
  
  describe ".file_type" do
    it "has file type CSV" do
      expect(Formats::CSVGenerator.file_type).to eq("Csv")
    end
  end

  describe ".write_to_file" do
    let (:data) {{name: 'Akshay', age: 23}}
    let (:path) {Formats::CSVGenerator.write_to_file(data)}

    it "gives path of the file it writes to" do
      expect(path).to be_an_instance_of(String)
    end

    it "gives a path which contains relevant file name" do
      expect(path).to match(/Resume.csv/)
    end
  end
end
