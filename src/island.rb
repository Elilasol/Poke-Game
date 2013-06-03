require 'pokemon_hash'
require 'route'
require 'trainer'
require 'decision_tree'

class Island
  attr_accessor :name, :trainers, :routes, :roadblocks, :average_level, :top_iv, :average_iv,
  :top_iv_trainer
  
  def initialize(name)
    
    fileroute = "files/routes/*.*"
    
    @name = name
    @top_iv = 0
    @average_iv = 0
    @trainers = load_trainers
    @top_iv_trainer = @trainers.first
    @average_level = 5
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
    
    n = 1000
    
    trainer_array = Array.new
    n.times do |i|
      trainer_array << @trainer = Trainer.new(self)
    end
    
    trainer_array
  end
  
  def pulse
    num_trainers = @trainers.size
    total_level = 0
    total_iv = 0
    top_iv = 0
    top_iv_trainer = nil

    @trainers.each do |i|
      Decision_Tree.new(i, @trainer_array)
      i.calculate_averages

      total_level += i.average_level
      total_iv += i.average_iv
      if top_iv < i.top_iv
        top_iv = i.top_iv
        top_iv_trainer = i
      end
    end

    @average_level = (total_level / num_trainers).to_f
    @average_iv = (total_iv / num_trainers).to_f
    @top_iv = top_iv
    @top_iv_trainer = top_iv_trainer
  end
  
  def route(route_name)
    @routes.each do |route|
      if route.name == route_name
        return route
      end
    end
  end
  
end
