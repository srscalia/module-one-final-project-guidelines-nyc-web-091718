# Class for Command Line Interface
class CLI
  attr_accessor :last_input

  def welcome
    puts "\n\nWelcome!"
  end # end for welcome

  def menu
    line_break = "\n\n"
    puts "#{line_break}What would you like to know about New York City public high schools? Please select a number.#{line_break}"
    puts "\t1. Overview of Boroughs"
    puts "\t2. Specific School Info#{line_break}"
    print "Enter number: "
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
        ask_for_input
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
        puts "\n\nWould you like to explore another borough?\n\n"
        print "Enter 'yes' or 'no': "
        ask_for_input
        if @last_input == 'yes'
          overview_of_boroughs_menu
        else
          break
          # puts "\n\nGoodbye. We'll miss you <3"
          # @last_input = "exit"
        end
      else
        overview_of_boroughs_menu
      end
    end
    menu
    menu_main_loop
  end

  def overview_of_boroughs_menu
    line_break = "\n\n"
    puts "#{line_break}What borough would you like to learn more about? Please select a number.#{line_break}"
    puts "\t1. Bronx"
    puts "\t2. Manahattan"
    puts "\t3. Queens"
    puts "\t4. Brooklyn"
    puts "\t5. Staten Island#{line_break}"
    print "Enter number: "
    ask_for_input
    puts line_break
    verify_borough_input

  end #end of overview_of_boroughs

  def overview_of_borough
    borough_id = @last_input.to_i
    borough = Borough.find(borough_id)
    borough.print_borough_info
  end #end of overview_of_borough

  def school_info
    line_break = "\n\n"
    print "#{line_break}Please enter name of school: "
    # Test with "Women's Academy of Excellence"
    ask_for_input
    while !(School.find_school(@last_input))
      line_break = "\n\n"
      print "#{line_break}Please enter name of school: "
      # Test with "Women's Academy of Excellence"
      ask_for_input
    end
    school = School.find_school(@last_input)
    school.print_school_info
    puts"\n\nWould you like to explore another school?\n\n"
    print "Enter 'yes' or 'no': "
    ask_for_input
    if @last_input == 'yes'
      school_info
    else
      menu
      menu_main_loop
    end
  end #end of school_info



end # end for Command Line Interface Class
