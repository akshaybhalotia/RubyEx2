require_relative 'file_generator'
require 'prawn'

class Formats::PDFGenerator < Formats::FileGenerator
  FILE_TYPE = "PDF"

  def self.file_type
    type = "PDF"
    return type
  end
  
  def self.write_to_file(data)
    file = File.open(File.join([File.expand_path('~'), 'Desktop', 'Resume.pdf']), 'w+')
    Prawn::Document.generate(file) do
      data.each {|key, value| text "#{key.to_s.capitalize}: #{value}"}
    end
    path = File.expand_path(file)
    file.close
    return path
  end
end
