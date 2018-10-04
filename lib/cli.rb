# Class for Command Line Interface
class CLI
  attr_accessor :last_input

  def call
    puts "Welcome!"
  end # end for call

  def menu
    line_break = "\n\n"
    puts "#{line_break}What would you like to know about New York City public high schools? Please select a number.#{line_break}"
    puts "1. Overview of Boroughs"
    puts "2. Specific School Info#{line_break}"
  end # end for menu

  def menu_main_loop
    ask_for_input
    while @last_input != "exit"
      case @last_input.to_i
      when 1
        overview_of_boroughs_menu
        break
      when 2
        school_info
        break
      else
        menu
        break
      end
    end
  end # end of menu_main_loop

  def ask_for_input
    @last_input = gets.strip
  end # end of user_input

  def verify_borough_input
    while @last_input != "exit"
      if @last_input == "1" || @last_input == "2" || @last_input == "3" || @last_input == "4" || @last_input == "5"
        overview_of_borough
      else
        overview_of_boroughs_menu
      end
    end
  end

  def overview_of_boroughs_menu
    line_break = "\n\n"
    puts "#{line_break}What would you like to know about New York City public high schools? Please select a number.#{line_break}"
    puts "1. Bronx"
    puts "2. Manahattan"
    puts "3. Queens"
    puts "4. Brooklyn"
    puts "5. Staten Island#{line_break}"
    ask_for_input
    verify_borough_input

  end #end of overview_of_boroughs

  def overview_of_borough
    borough_id = @last_input.to_i
    borough = Borough.find(borough_id)

  end #end of overview_of_borough

  def school_info

  end #end of school_info



end # end for Command Line Interface Class
