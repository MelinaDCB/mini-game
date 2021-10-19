class Game
    attr_accessor :human_player, :enemies

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        @player1 = Player.new("player1")
        @player2 = Player.new("player2")
        @player3 = Player.new("player3")
        @player4 = Player.new("player4")
        @enemies = []
        @enemies = [@player1, @player2, @player3, @player4]
        
    end

    def kill_player
        @enemies.each do |bot|
            if bot.life_points <= 0
                @enemies.delete(bot)
            end
        end
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && !@enemies.empty?
            return true
        else
            return false
        end
    end

    def show_players
        puts "#{@human_player.name} has #{@human_player.life_points} HP and a weapon level of #{@human_player.weapon_level}. "
        puts "#{@enemies.length} bots are left."
    end

    def menu
        puts "           "
        puts "What do you want to do ? (careful it's case sensitive)"
        puts "           "
        puts "a - look for a better weapon"
        puts "b - look for a health pack"
        puts "             "
        puts "Attack another player on sight : "
        print "1 - "
        print "#{@player1.show_state}"
        print "2 - "
        print "#{@player2.show_state}"
        print "3 - "
        print "#{@player3.show_state}"
        print "4 - "
        print "#{@player4.show_state}"
        puts "----------------------------"
        print "Your choice : "
    end    

    def menu_choice(choice)
        if choice == "a"
            @human_player.search_weapon
        elsif choice == "b"
            @human_player.search_health_pack
        elsif choice == "1"
            @human_player.attacks(@player1)
        elsif choice == "2"
            @human_player.attacks(@player2)
        elsif choice == "3"
            @human_player.attacks(@player3)
        elsif choice == "4"
            @human_player.attacks(@player4)
        else
            puts "Wrong choice, please try again."
        end
        kill_player
    end

    def enemies_attack
        puts "----------------------------"
        puts "Other players fight back ! "
        @enemies.each do |bot|
            bot.attacks(@human_player)
        end
    end

    def the_end
        puts "  _______ _                           _   _ "
        puts " |__   __| |                         | | | |"
        puts "    | |  | |__   ___    ___ _ __   __| | | |"
        puts "    | |  | '_ \ / _ \  / _ \ '_ \ / _` | | |"
        puts "    | |  | | | |  __/ |  __/ | | | (_| | |_|"
        puts "    |_|  |_| |_|\___|  \___|_| |_|\__,_| (_)"
        puts "                                            "
        if @human_player.life_points > 0
            puts "You win !"
        else
            puts "You lose..."
        end
    end
end