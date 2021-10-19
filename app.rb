require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("John")
player2 = Player.new("James")
puts "Here are our two fighters :"
puts "********************************"
player1.show_state
player2.show_state
puts "********************************"
puts "FIGHT !"
puts "                   "

while player1.life_points > 0 && player2.life_points > 0
    player1.attacks(player2)
    if player2.life_points > 0
        player2.attacks(player1)
    else
        break
    end
    puts "                   "
    puts "Our champions' health states : "
    player1.show_state
    player2.show_state
    puts "                   "
end



binding.pry