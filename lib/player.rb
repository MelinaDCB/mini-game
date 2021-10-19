# name is a local variable @name is an instance variable.
class Player
    attr_accessor :name, :life_points

    def initialize(name, life_points = 10)
        @name = name
        @life_points = life_points
    end
    
    def show_state
        puts "#{@name} has #{@life_points} HP."
    end

    def gets_damaged(damage_value)
        @life_points -= damage_value
        if @life_points <= 0
            puts "#{@name} has been killed !"
        end
    end

    def attacks(player)
        puts "#{@name} attacks #{player.name}."
        damage_value = compute_damage
        player.gets_damaged(damage_value)
        puts "#{player.name} has #{player.life_points} HP."
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player