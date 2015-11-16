require_relative 'file_generator'

class Formats::CSVGenerator < Formats::FileGenerator
  def self.file_type
    type = "Csv"
    return type
  end
  
  def self.write_to_file(data)
    file = File.open(File.join([File.expand_path('~'), 'Desktop', 'Resume.csv']), 'w+')
    data.each do |key, value|
      file.puts "#{key.to_s.capitalize},#{value}"
    end
    path = File.expand_path(file)
    file.close
    return path
  end
end
