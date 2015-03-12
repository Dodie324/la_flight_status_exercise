require 'pry'

class Airplane
  attr_reader :type, :wing_loading, :horsepower
  attr_writer :fuel

  def initialize(type, wing_loading, horsepower, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @fuel = fuel
    @started = false
    @flying = false
  end

  def method_off
    @started = false
  end

  def start
    if !@started
      if @fuel >= 10
        @fuel -= 10
        @started = true
        "airplane started"
      else
        "not enough gas"
      end
    else
      "airplane already started"
    end
  end

  def takeoff
    if @started
      if @fuel >= 20
        @fuel -= 20
        @flying = true
        "airplane launched"
      else
        "not enough gas for liftoff"
      end
    else
      "airplane not started, please start"
    end
  end

  def land
    if @started
      if @flying
        if @fuel > 10
          @fuel -= 10
          @flying = false
          "airplane landed"
        else
          'yall is done for'
        end
      else
        "airplane already on the ground"
      end
    else
      "airplane not started, please start"
    end
  end

end
