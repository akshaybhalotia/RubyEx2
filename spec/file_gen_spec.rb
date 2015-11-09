require 'spec_helper'

describe "Formats::FileGenerator" do

  describe "::FILE_TYPE" do
    it "has a file type" do
      expect(Formats::FileGenerator::FILE_TYPE).to eq("format_name(override)")
    end
  end

  describe ".write_to_file" do
    it "writes to files" do
      data = Object.new
      expect(Formats::FileGenerator.write_to_file(data)).to eq("You need to overwrite this method")
    end
  end
end
