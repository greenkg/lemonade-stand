class Player

  def initialize
    @cash = 100
    @lemons = 2
    @sugar = 2
    @ice = 2
    @pitchers = 0
  end

  def print_status
    puts "*" * 50
    puts "Cash: $#{@cash}"
    puts "Lemons: #{@lemons} lemons"
    puts "Sugar: #{@sugar} cups"
    puts "Ice: #{@ice} bags"
    puts "Pitchers of lemonade: #{@pitchers}"
    puts "*" * 50
  end

  def has_cash?
    @cash > 0
  end

  def make_lemonade(lemons, sugar, ice)
    if @lemons >= lemons && @sugar >= sugar && @ice >= ice
      @pitchers += 1
      @lemons -= lemons
      @sugar -= sugar
      @ice -= ice
      puts "You made one pitcher of lemonade!"
      print_status
    else
      puts "You need #{lemons} lemons, #{sugar} cups of sugar, and #{ice} bags of ice to make a pitcher of lemonade."
    end
  end

  def buy_lemons(n)
    @lemons += n
    @cash -= (5 * n)
    puts "You bought #{n} lemons for $#{n * 5}."
  end

end