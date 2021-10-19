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
user_name = gets.chomp
player3 = HumanPlayer.new(user_name)
player1 = Player.new("John")
player2 = Player.new("James")
enemies = []
enemies << player1
enemies << player2

while player3.life_points >0 && (player1.life_points > 0 || player2.life_points > 0)
    player3.show_state
    puts "           "
    puts "What do you want to do ? (careful it's case sensitive)"
    puts "           "
    puts "a - look for a better weapon"
    puts "b - look for a health pack"
    puts "             "
    puts "Attack another player on sight : "
    print "1 - "
    print "#{player1.show_state}"
    print "2 - "
    print "#{player2.show_state}"
    puts "----------------------------"
    print "Your choice : "
    choice = gets.chomp
    puts "                   "
    if choice == "a"
        player3.search_weapon
    elsif choice == "b"
        player3.search_health_pack
    elsif choice == "1"
        player3.attacks(player1)
    elsif choice == "2"
        player3.attacks(player2)
    elsif choice == "exit"
        break
    else
        puts "Wrong choice, please try again."
    end
    if player1.life_points > 0 || player2.life_points > 0
        puts "----------------------------"
        puts "Other players fight back ! "
    end
    enemies.each do |playerX|
        if playerX.life_points > 0 
            playerX.attacks(player3)
        end
    end
    
    

end

puts "  _______ _                           _   _ "
puts " |__   __| |                         | | | |"
puts "    | |  | |__   ___    ___ _ __   __| | | |"
puts "    | |  | '_ \ / _ \  / _ \ '_ \ / _` | | |"
puts "    | |  | | | |  __/ |  __/ | | | (_| | |_|"
puts "    |_|  |_| |_|\___|  \___|_| |_|\__,_| (_)"
puts "                                            "


if player3.life_points > 0
    puts "You win !"
else
    puts "You lose..."
end












binding.pry