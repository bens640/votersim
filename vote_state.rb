require './main_menu.rb'

puts 'Welcome to the 2015 presidential election. Where you have almost all control!!!'
puts `clear`
x = MainMenu.new
until x.gamestate == 1
	x.first_question
end