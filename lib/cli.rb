# Class for Command Line Interface
class CLI
  attr_accessor :last_input

  def call
    puts "Welcome!"
  end # end for call

  def menu
    puts "What would you like to know about New York City public high schools?"
    puts "1. Overview of Boroughs"
    puts "2. Student engagement"
    puts "3. Graduation rates and college placement"
    puts "4. Subway access"
  end # end for menu

  def menu_main_loop
    while user_input != "exit"
      case user_input.to_i
      when 1

        break
      when 2
        break
      when 3
        break
      when 4
        break
      else
        menu
        break
      end
    end
  end # end of menu_main_loop

  def user_input
    @last_input = gets.strip
  end # end of user_input



end # end for Command Line Interface Class
