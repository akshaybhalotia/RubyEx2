class FileFormatter

  def initialize
    formats = Formats.constants.map { |c| Formats.const_get(c) }
    formats.select! { |c| c.is_a? Class }
    @files = formats.select { |klass| (klass.methods(false) - Object.methods).include?(:write_to_file) && klass::FILE_TYPE }
  end

  def get_formats
    @files.map {|format| format::FILE_TYPE.upcase}
  end
  
  def output_file(info, choice)
    @files[choice].write_to_file(info)
  end
end
