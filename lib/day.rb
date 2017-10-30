require_relative 'gaussian'

class Day
  
  attr_reader :customers

  def initialize(max_customers, base_customers, recipe_enjoyment)
    @max_customers, @base_customers, @recipe_enjoyment = max_customers, base_customers, recipe_enjoyment
    @gaussian = Gaussian.new(base_customers, base_customers/6)
  end

  def get_customers
    rand_customers = @gaussian.rand * self.get_effect
    @customers = rand_customers > @max_customers ? @max_customers : rand_customers
  end

  def get_effect
    EFFECTS = {
      #list effects here
    }
  end

  def print_description
    puts "It was a beautiful sunny day."
    puts "You sold #{@customers} cups of lemonade."
  end

end