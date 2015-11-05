require_relative 'file_generator'
require 'prawn'

class PDFGenerator < FileGenerator
  FILE_TYPE = "PDF"
  
  def self.write_to_file(data)
    file = File.open(File.join([File.expand_path('~'), 'Desktop', 'Resume.pdf']), 'w+')
    Prawn::Document.generate(file) do
      data.each {|key, value| text "#{key}: #{value}"}
    end
    path = File.expand_path(file)
    binding.pry
    file.close
    return path
  end
end