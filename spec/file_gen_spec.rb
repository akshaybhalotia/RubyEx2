require 'spec_helper'

describe "Formats::FileGenerator" do

  describe ".file_type" do
    it "has a file type" do
      expect(Formats::FileGenerator.file_type).to eq("You need to overwrite this method")
    end
  end

  describe ".write_to_file" do
    it "writes to files" do
      data = double(Hash)
      expect(Formats::FileGenerator.write_to_file(data)).to eq("You need to overwrite this method")
    end
  end
end
