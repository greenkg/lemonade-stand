# Gaussian is used to generate a random number clustered around a midpoint
class Gaussian
  attr_reader :range

  def initialize(mean = 0.0, stddev = 1.0, range = lambda { Kernel.rand })
    @mean = mean
    @stddev = stddev
    @range = range
    @compute_next_pair = false
  end

  def rand
    if (@compute_next_pair = !@compute_next_pair)
      theta = 2 * Math::PI * @range.call
      rho = Math.sqrt(-2 * Math.log(1 - @range.call))
      scale = @stddev * rho
      @g1 = @mean + scale * Math.cos(theta)
      @g2 = @mean + scale * Math.sin(theta)
    else
      @g1
    end
  end
  
end