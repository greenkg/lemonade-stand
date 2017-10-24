require_relative 'day'
require_relative 'inventory'


class Player

  attr_reader :cash

  def initialize
    @inventory = Inventory.new
  end

  def print_status
    @inventory.print_inventory
  end

  def has_cash?
    @inventory.get_cash > 0
  end

  def buy(item, n)
    n = n.to_i
    item = item.to_sym
    total_cost = @inventory.get_price(item) * n
    #best way to figure out which item to add to?
    if total_cost < @inventory.get_cash
      puts "You bought #{n} #{item} for $#{total_cost}"
      @inventory.buy_items(item, n)
    else
      puts "That would cost $#{total_cost}. You don't have enough money to do that."
    end
  end

  def make_lemonade(lemons, sugar, ice)
    if @inventory.get_lemons >= lemons && @inventory.get_sugar >= sugar && @inventory.get_ice >= ice
      @inventory.make_pitchers(1)
      @inventory.use_lemons(1)
      @inventory.use_sugar(1)
      @inventory.use_ice(1)      
    else
      puts "You need #{lemons} lemons, #{sugar} cups of sugar, and #{ice} bags of ice to make a pitcher of lemonade."
    end
  end

  def start_day
    day = Day.new(@inventory.get_max_sales)
    day.print_description
    revenue = day.customers * 1
    @inventory.add_cash(revenue)
    @inventory.use_cups(day.customers)
    @inventory.use_pitchers
  end

end