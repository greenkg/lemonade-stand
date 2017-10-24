class Inventory

  attr_accessor :lemons, :ice, :sugar

  def initialize
    @lemons = 0
    @ice = 0
    @sugar = 0
  end

  def to_s
    "Inventory: #{@lemons} lemons, #{@ice} bags of ice, #{@sugar} cups of sugar"
  end

  def number_of_lemons
    "#{@lemons} lemons"
  end

  def add_lemons(num)
    @lemons += num
  end

  def remove_lemons(num)
    if @lemons >= num
      @lemons -= num
    else
      puts "Not enough lemons to reduce by #{num}"
    end
  end

end

myInventory = Inventory.new
puts myInventory
myInventory.add_lemons(2)
puts myInventory
puts myInventory.remove(@lemons, 1)