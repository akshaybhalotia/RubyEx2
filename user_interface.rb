class UserInterface
  
  attr_reader :choice

  def welcome
    puts "Welcome to Resume Generator"
  end
  
  def display_list(list)
    unless list.size > 0
      puts "No formats available" 
      return
    end
    list.each_with_index {|item, index| puts "#{index+1}. #{item.upcase}"}
  end

  def display_filepath(path)
    puts "File written successfully at #{path}"
  end

  def get_choice
    @choice = gets.to_i
  end
end
