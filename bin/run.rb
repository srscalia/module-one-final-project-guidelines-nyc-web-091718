require_relative '../config/environment'

cli = CLI.new

cli.call
cli.menu
cli.menu_main_loop
