class Day
  

  attr_reader :customers

  def initialize(max_customers)
    @customers = (0..max_customers).to_a.sample
  end

  def print_description
    puts "It was a beautiful sunny day."
    puts "You sold #{@customers} cups of lemonade."
  end

end