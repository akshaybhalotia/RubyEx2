require 'spec_helper'

describe FileFormatter do

  let (:file_formatter) {FileFormatter.new}

  describe "#get_formats" do
    context "when no formats" do
      it "gives empty list" do
        expect(file_formatter.get_formats).to eq([])
      end
    end

    context "when pdf available" do
      it "gives list containing pdf" do
        expect(file_formatter.get_formats).to eq(["pdf"])
      end
    end
  end
end
