require_relative 'file_generator'

class CSVGenerator < FileGenerator
  FILE_TYPE = "Csv"
  
  def self.write_to_file(data)
    file = File.open(File.join([File.expand_path('~'), 'Desktop', 'Resume.csv']), 'w+')
    data.each do |key, value|
      file.puts "#{key},#{value}"
    end
    path = File.expand_path(file)
    binding.pry
    file.close
    return path
  end
end
