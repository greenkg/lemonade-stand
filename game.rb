require_relative 'lib/player'

class Game

  ACTIONS = [
    :buy_lemons, :make_lemonade, :buy_sugar, :buy_ice, :buy_cups, :start_day
  ]

  WELCOME_MESSAGE = 
    "Hello proprietor. Welcome to lemonade stand.
    \nYou have 30 days to make as much money as possible.
    \nA pitcher of lemonade is 10 cups.
    \nYou can enter actions: buy lemons (or sugar, ice, cups), make lemonade, and start day."

  def initialize
    @player = Player.new
    @day = 1

    start_game
  end

private
  
    def start_game
      puts WELCOME_MESSAGE
      while @player.has_cash? && @day < 6
        puts "Day #{@day}. Here's where you're at:"
        @player.print_status
        take_player_input
      end

      puts "Game over! Your score is #{@player.cash - 100}"
    end

    def take_player_input
      print "What would you like to do next? >> "
      player_input = gets.chomp
      take_action(player_input)
    end

    def take_action(input)
      quantity = input[/\d+/] || 1
      if input[/lemon/]
        puts "You buy #{quantity} lemons."
        @player.buy_lemons(quantity)
      elsif input[/ice/]
        puts "You buy #{quantity} bags of ice."
        @player.buy_ice(quantity)
      elsif input[/sugar/]
        puts "You buy #{quantity} cups of ice."
        @player.buy_sugar(quantity)
      elsif input[/cup/]
        puts "You buy #{quantity} cups."
        @player.buy_cups(quantity)
      elsif input[/lemonade/]
        puts "You make #{quantity} pitchers of lemonade"
        @player.make_lemonade(quantity, quantity, quantity)
      elsif input[/start day/]
        puts "The day begins."
        @player.start_day
      else
        puts ">>>>> I'm sorry, I don't undestand your command."
      end
    end

end

Game.new