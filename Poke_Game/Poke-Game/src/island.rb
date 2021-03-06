require 'pokemon_hash'
require 'route'
require 'trainer'
require 'decision_tree'

class Island
  attr_accessor :name, :trainers, :routes, :roadblocks
  
  def initialize(name)
    
    fileroute = "files/routes/*.*"
    
    @name = name
    @trainers = load_trainers
    @routes = Array.new
    load_routes(fileroute)
    @roadblocks = load_blockades
  end
  
  def load_routes(fileroute)
    
    Dir[fileroute].each do |file|
      @routes << Route.new(file)
    end
  end
  
  def load_blockades
    blockades = Array.new
    
    blockades << Hash["route_from" => "2", "route_to" => "digletts_cave", "requirement" => "item_hm_01"]
    blockades << Hash["route_from" => "pewter_city", "route_to" => "3", "requirement" => "boulder_badge"]
    blockades << Hash["route_from" => "cerulean_city", "route_to" => "4", "requirement" => "item_hm_03"]
  end
  
  def load_trainers
    
    n = 3
    
    trainer_array = Array.new
    n.times do |i|
      trainer_array << @trainer = Trainer.new(self)
    end
    
    trainer_array
  end
  
  def pulse
    @trainers.each do |i|
      Decision_Tree.new(i, @trainer_array)
    end
  end
  
  def route(route_name)
    @routes.each do |route|
      if route.name == route_name
        return route
      end
    end
  end
  
end