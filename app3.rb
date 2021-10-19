require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " ------------------------------------------ "
puts "|Welcome to the game you always want to win |"
puts "| Your goal is to be the last one standing  |"  
puts "|   (yes 'winner winner chicken dinner')    |"
puts " ------------------------------------------ "
puts "      "
print "What is your name ? "
human_name = gets.chomp

my_game = Game.new(human_name)

while my_game.is_still_ongoing? == true 
    my_game.show_players
    my_game.menu
    user_choice = gets.chomp.to_s
    puts " ------------------------------------------ "
    my_game.menu_choice(user_choice)
    my_game.enemies_attack
end

my_game.the_end

binding.pry