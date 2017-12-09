# Determines what random events occur and how many customers
require_relative 'gaussian'

class Day
  attr_reader :customers

  def initialize(max_customers, base_customers, recipe_enjoyment)
    @max_customerr = max_customers
    @base_customers = base_customers
    @recipe_enjoyment = max_customers
    @gaussian = Gaussian.new(base_customers, base_customers / 2)
    @customers = generate_customers
  end

  def generate_customers
    rand_customers = @gaussian.rand.to_i
    customers = rand_customers > @max_customers ? @max_customers : rand_customers
    customers = customers < 0 ? 0 : customers
  end

  def print_description
    puts '*' * 50
    puts 'It was a beautiful sunny day.'
    puts 'You sold #{@customers} cups of lemonade.'
  end

end