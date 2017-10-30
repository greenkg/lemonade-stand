require_relative 'day'
require_relative 'inventory'
require_relative 'recipe'


class Player

  attr_reader :cash

  def initialize
    @inventory = Inventory.new
    @recipe = Recipe.new(4, 0.5, 4)
    @base_customers = 10
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

  def make_lemonade(qty = 1)
    if @inventory.get_lemons >= @recipe.lemons*qty && @inventory.get_sugar >= @recipe.sugar*qty && @inventory.get_ice >= @recipe.ice*qty
      @inventory.make_pitchers(qty)
      @inventory.use_lemons(qty)
      @inventory.use_sugar(qty)
      @inventory.use_ice(qty)      
    else
      puts "You need #{@recipe.lemons} lemons, #{@recipe.sugar} cups of sugar, and #{@recipe.ice} bags of ice to make a pitcher of lemonade."
    end
  end

  def start_day
    day = Day.new(@inventory.get_max_sales, @base_customers, @recipe.avg_enjoyment)
    day.print_description
    revenue = day.customers * 1
    @inventory.add_cash(revenue)
    @inventory.use_cups(day.customers)
    @inventory.use_pitchers
  end

  def update_base_customers(prior_day_customers)
    growth_from_prior_day = prior_day_customers * @recipe.avg_enjoyment * 0.25
    @base_customers = @base_customers + growth_from_prior_day.to_i
  end

end