require_relative 'lib/player'

class Game

  ACTIONS = [
    :buy_lemons, :make_lemonade, :buy_sugar, :buy_ice, :buy_cups, :start_day
  ]

  WELCOME_MESSAGE = 
    "Hello proprietor. Welcome to lemonade stand.
    \nYou have 30 days to make as much money as possible.
    \nA pitcher of lemonade is 10 cups."

  def initialize
    @player = Player.new

    start_game
  end

private
  
    def start_game
      puts WELCOME_MESSAGE
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
      when :buy_sugar
        @player.buy_sugar(1)
      when :buy_ice
        @player.buy_ice(1)
      when :buy_cups
        @player.buy_cups(20)
      when :make_lemonade
        @player.make_lemonade(1, 1, 1)
      when :start_day
        @player.start_day
      end
    end

end

Game.new