class Recipe

  attr_reader :lemons, :sugar, :ice
  
  def initialize(lemons = 3, sugar = 2, ice = 4)
    @lemons = lemons
    @sugar = sugar
    @ice = ice
    @satisfaction
  end

  def to_s
    "RECIPE: Lemons: #{@lemons}. Cups of sugar: #{@sugar}. Cups of ice: #{@ice}."
  end

  def change(lemons, sugar, ice)
    @lemons = lemons
    @sugar = sugar
    @ice = ice
  end

  def set_lemons(n)
    @lemons = n
  end

  def set_sugar(n)
    @sugar = n
  end

  def set_ice(n)
    @ice = n
  end

  def avg_enjoyment
    
    if (@lemons < 0.5 || @lemons > 11)
      lemon_score = 0
    else
      lemon_score = (0.00212703*(@lemons**4)) - (0.051049*(@lemons**3)) + (0.36489*(@lemons**2)) - (0.703147*(@lemons)) + 0.353
    end

    sugar_f = @sugar.to_f
    lemons_f = @lemons.to_f    
    sugar_ratio = (sugar_f / lemons_f)

    if (sugar_ratio <= 0 || sugar_ratio > 0.35)
      sugar_score = 0
    else
      sugar_score = (1705.07322*(sugar_ratio**4)) - (1136.72*(sugar_ratio**3)) + (201.046*(sugar_ratio**2)) - (3.8643*sugar_ratio) + 0.006
    end

    if (@ice <= 0 || @ice > 6)
      ice_score = 0
    else 
      ice_score = (0.007376*(@ice**4)) - (0.090909*(@ice**3)) + (0.231818*(@ice**2)) + (0.245455*@ice)
    end

    score = lemon_score * sugar_score * ice_score

  end

end