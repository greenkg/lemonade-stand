require_relative 'lib/player'

# Primary class to run Lemonade game
class Game
  ACTIONS = %i[
    buy_lemons make_lemonade buy_sugar buy_ice buy_cups start_day
  ].freeze
  WELCOME_MESSAGE =
    "Hello proprietor. Welcome to lemonade stand.
    \nYou have 30 days to make as much money as possible.
    \nA pitcher of lemonade is 10 cups.
    \nYou can enter actions: buy lemons (or sugar, ice, cups),
    \nmake lemonade, and start day.".freeze
  def initialize
    @player = Player.new
    @day = 1

    start_game
  end

  private

  def start_game
    puts WELCOME_MESSAGE
    @player.print_status
    take_player_input while @player.cash? && @day < 6
    puts "Game over! Your score is #{@player.cash - 100}"
  end

  def take_player_input
    puts "Day #{@day} What would you like to do next? >> "
    player_input = gets.chomp
    take_action(player_input)
  end

  def take_action(input)
    quantity = input[/\d+/] || 1
    if input[/buy/]
      message = 'You want to buy #{quantity} '
      if input[/lemon/]
        puts message + 'lemons.'
        @player.buy('lemons', quantity)
      elsif input[/ice/]
        puts message + 'bags of ice.'
        @player.buy('ice', quantity)
      elsif input[/sugar/]
        puts message + 'cups of sugar.'
        @player.buy('sugar', quantity)
      elsif input[/cup/]
        puts message + 'cups.'
        @player.buy('cups', quantity)
      else
        puts "I'm sorry, you can't buy that."
      end
    elsif input[/lemonade/]
      puts "You want to make #{quantity} pitchers of lemonade"
      @player.make_lemonade(quantity)
    elsif input[/start day/]
      puts 'You want to start the day.'
      @player.start_day
      @player.print_status
      @day += 1
    else
      puts ">>>>> I'm sorry, I don't undestand your command."
    end
  end

end

Game.new