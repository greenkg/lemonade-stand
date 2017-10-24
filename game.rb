require_relative 'lib/player'

class Game

  ACTIONS = [
    :buy_lemons, :make_lemonade
  ]

  def initialize
    @player = Player.new

    start_game
  end

private
  
    def start_game
      while @player.has_cash?
        @player.print_status
        action = take_player_input
        if ACTIONS.include? action
          take_action(action)
        else
          puts ">>>> I'm sorry, I don't understand."
          next
        end
      end
    end

    def take_player_input
      print "What would you like to do next? >> "
      gets.chomp.gsub!(/ /, "_").to_sym
    end

    def take_action(action)
      puts "Requested action is #{action}."
      case action
      when :buy_lemons
        @player.buy_lemons(1)
      when :make_lemonade
        @player.make_lemonade(1, 1, 1)
      end
    end

end

Game.new