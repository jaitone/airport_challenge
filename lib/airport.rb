require_relative 'plane'



class Airport
  attr_reader :hangar, :planes

  DEFAULT_CAPACITY = 20
  def initialize(hangar = DEFAULT_CAPACITY)
    @planes = []
    @hangar = hangar # need integer there??
  end
  def take_off
    fail "No planes, can't take off" if @planes.empty?
    planes.pop
  end
  
  def land(plane)
    fail 'Airport is full' if @planes.count >= 20
    planes << plane
  end
  
  private 
  
  def full?
    planes.count >= hangar
  end

  def empty?
    planes.empty?
  end
end
