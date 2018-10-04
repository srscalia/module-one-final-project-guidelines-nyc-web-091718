# Class for Command Line Interface
class CLI
  attr_accessor :last_input

  def call
    puts "Welcome!"
  end # end for call

  def menu
    puts "What would you like to know about New York City public high schools? Please select a number."
    puts "1. Overview of Boroughs"
    puts "2. Student engagement"
    puts "3. Graduation rates and college placement"
    puts "4. Subway access"
  end # end for menu

  def menu_main_loop
    puts "Before you enter a number."
    ask_for_input
    puts "After you enter a number."
    while @last_input != "exit"
      case @last_input.to_i
      when 1
        binding.pry
        overview_of_boroughs_menu
        break
      when 2
        student_engagement
        break
      when 3
        grad_college_rates
        break
      when 4
        subway
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
    puts "What would you like to know about New York City public high schools? Please select a number."
    puts "Bronx (Enter 1)"
    puts "Manahattan (Enter 2)"
    puts "Queens (Enter 3)"
    puts "Brooklyn (Enter 4)"
    puts "Staten Island (Enter 5)"
    ask_for_input
    verify_borough_input

  end #end of overview_of_boroughs

  def student_engagement

  end #end of student_engagement

  def grad_college_rates

  end #end of grad_college_rates

  def subway

  end #end of subway



end # end for Command Line Interface Class
