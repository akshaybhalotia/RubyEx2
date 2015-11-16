require_relative './formats/file_generator'

class FileFormatter

  def initialize
    Dir[File.join(__dir__, 'formats', '*.rb')].each do |file|
      load file
    end
    formats = Formats.constants.map { |c| Formats.const_get(c) }
    formats.select! { |c| c.is_a? Class }
    file_names = formats.select { |klass| has_required_methods?(klass) }
    @files = file_names - [Formats::FileGenerator]
  end

  def has_required_methods?(klass)
    contains = true
    [:write_to_file, :file_type].each do |meth_name|
      contains = contains && (klass.methods(false) - Object.methods).include?(meth_name)
    end
    return contains
  end
    
  def get_formats
    @files.map {|format| format.file_type.upcase}
  end
  
  def output_file(info, choice)
    @files[choice-1].write_to_file(info)
  end
end
