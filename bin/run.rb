require_relative '../config/environment'

cli = CLI.new

cli.welcome
cli.menu
cli.menu_main_loop
