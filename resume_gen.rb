require_relative './user_interface'
require_relative './file_formatter'

at_exit {puts "Bye! Have a great day."}

class ResumeGen

  def initialize(fields)
    @fields = fields
    @user_interface = UserInterface.new
    @file_formatter = FileFormatter.new
  end

  def print_welcome
    @user_interface.welcome
  end
    
  def input_data
    @user_interface.get_data(@fields)
  end

  def fetch_list
    list = @file_formatter.get_formats
  end
  
  def user_choice
    @user_interface.display_list(fetch_list)
    @user_interface.get_choice
  end

  def print_file(info, choice)
    path = @file_formatter.output_file(info, choice)
  end

  def display_file_path
    @user_interface.display_filepath(print_file(input_data, user_choice))
  end

end
