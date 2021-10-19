# name is a local variable @name is an instance variable.
class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
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
        if player.life_points > 0
            puts "#{player.name} has #{player.life_points} HP."
        end
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level, :life_points, :name

    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} has #{@life_points} HP and a weapon level of #{@weapon_level}. "
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        dice_roll = rand(1..6)
        puts "You've found a new weapon, and it's level #{dice_roll} !"
        if dice_roll > @weapon_level
            puts "Great, an upgrade, it's now MINE !"
            @weapon_level = dice_roll
        else
            puts "Damn, my actual weapon is better, I'll keep it."
        end
    end

    def search_health_pack
        health_roll = rand(1..6)
        if health_roll == 1
            puts "You find nothing.."
        elsif health_roll >= 2 && health_roll <= 5
            puts "Hey, you've found a +50 HP pack !"
            @life_points += 50
            if @life_points > 100
                @life_points = 100
            end
        else
            puts "Wooow, is that a +80 HP pack ? Yes it is and it's mine !"
            @life_points += 80
            if @life_points > 100
                @life_points = 100
            end
        end
    end

end