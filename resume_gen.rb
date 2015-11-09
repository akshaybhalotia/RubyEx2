require_relative './user_interface'
require_relative './file_formatter'

at_exit {puts "Bye! Have a great day."}

class ResumeGen

  def initialize(fields)
    @fields = fields
    @user_interface = UserInterface.new
    @file_formatter = FileFormatter.new
  end

  def input_data
    @user_interface.welcome
    @user_interface.get_data(@fields)
  end

  def user_choice
    list = @file_formatter.get_formats
    @user_interface.display_list(list)
    @user_interface.get_choice
  end

  def print_file(info, choice)
    path = @file_formatter.output_file(info, choice)
    @user_interface.display_filepath(path)
  end

end
