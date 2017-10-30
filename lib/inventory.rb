class Inventory

  def initialize
    @inventory = {:cash => 100, :lemons => 2, :sugar => 2, :ice => 2, :cups => 20, :pitchers => 2}
  end

  def print_inventory
    puts "*" * 10
    puts "CASH: $#{get_cash}"
    puts "INVENTORY: Lemons: #{get_lemons} lemons. Sugar: #{get_sugar} cups. Ice: #{get_ice} bags. Cups: #{get_cups} cups"
    puts "Pitchers of lemonade: #{get_pitchers} pitchers"
    puts "*" * 10
  end

  def get_cash
    @inventory[:cash]
  end

  def get_lemons
    @inventory[:lemons]
  end

  def get_sugar
    @inventory[:sugar]
  end

  def get_ice
    @inventory[:ice]
  end

  def get_cups
    @inventory[:cups]
  end

  def get_pitchers
    @inventory[:pitchers]
  end

  def make_pitchers(n)
    @inventory[:pitchers] += 1
    puts "You made one pitcher of lemonade!"
  end

  def get_price(item)
    case item
    when :lemons
      1
    when :sugar
      0.5
    when :ice
      0.50
    when :cups
      0.10
    end
  end

  def get_max_sales
    get_cups > get_pitchers * 10 ? get_pitchers * 10 : get_cups
  end

  def add_cash(n)
    @inventory[:cash] += n
  end

  def use_lemons(n)
    @inventory[:lemons] -= n
  end

  def use_sugar(n)
    @inventory[:sugar] -= n
  end

  def use_ice(n)
    @inventory[:ice] -= n
  end

  def use_cups(n)
    @inventory[:cups] -= n
  end

  def use_pitchers
    @inventory[:pitchers] = 0
  end

  def buy_items(item, quantity)
    @inventory[item] += quantity
    @inventory[:cash] -= (quantity * get_price(item))
  end

end