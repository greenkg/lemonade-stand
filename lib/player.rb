require_relative 'day'

class Player

  attr_reader :cash

  def initialize
    @cash = 100
    @lemons = 2
    @sugar = 2
    @ice = 2
    @cups = 20
    @pitchers = 2
  end

  def print_status
    puts "*" * 50
    puts "Cash: $#{@cash}"
    puts "Lemons: #{@lemons} lemons"
    puts "Sugar: #{@sugar} cups"
    puts "Ice: #{@ice} bags"
    puts "Cups: #{@cups} cups"
    puts "Pitchers of lemonade: #{@pitchers}"
    puts "*" * 50
  end

  def has_cash?
    @cash > 0
  end

  def buy_lemons(n)
    n = n.to_i
    @lemons += n
    @cash -= (5 * n)
    puts "You bought #{n} lemons for $#{n * 5}."
  end

  def buy_sugar(n)
    @sugar += n
    @cash -= (10 * n)
    puts "You bought #{n} cups of sugar for $#{n * 10}."
  end

  def buy_ice(n)
    @ice += n
    @cash -= (3 * n)
    puts "You bought #{n} bags of ice for $#{n * 3}."
  end

  def buy_cups(n)
    @cups += n
    @cash -= (0.25 * n)
    puts "You bought #{n} cups for $#{n * 0.25}."
  end 

  def make_lemonade(lemons, sugar, ice)
    if @lemons >= lemons && @sugar >= sugar && @ice >= ice
      @pitchers += 1
      @lemons -= lemons
      @sugar -= sugar
      @ice -= ice
      puts "You made one pitcher of lemonade!"
    else
      puts "You need #{lemons} lemons, #{sugar} cups of sugar, and #{ice} bags of ice to make a pitcher of lemonade."
    end
  end

  def start_day
    max_cups = @cups > @pitchers*10 ? @pitchers*10 : @cups
    day = Day.new(max_cups)
    day.print_description
    revenue = day.customers * 1
    @cash += revenue
    @pitchers = 0
    @cups -= day.customers
  end

end