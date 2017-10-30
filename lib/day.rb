require_relative 'gaussian'

class Day
  
  attr_reader :customers

  def initialize(max_customers, base_customers, recipe_enjoyment)
    @max_customers, @base_customers, @recipe_enjoyment = max_customers, base_customers, recipe_enjoyment
    @gaussian = Gaussian.new(base_customers, base_customers/2)
    @customers = get_customers
  end

  def get_customers
    rand_customers = @gaussian.rand.to_i
    customers = rand_customers > @max_customers ? @max_customers : rand_customers
    customers = 0 > customers ? 0 : customers
  end

  def print_description
    puts "*" * 50
    puts "It was a beautiful sunny day."
    puts "You sold #{@customers} cups of lemonade."
  end

end