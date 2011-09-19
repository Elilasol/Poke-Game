require 'spec_helper'

describe Island do
  before :all do
    POKEMON_HASH = Pokemon_Hash.read("files/etc/pokemon.txt")
    TRAINER_HASH = Pokemon_Hash.read("files/trainers/trainers.txt")
    TYPE_HASH = Pokemon_Hash.read("files/etc/types.txt")
    DECISION_IMPORTANCE = Hash["Heal", 9, "Fight Trainer", 8, "Fight Gym", 7, "Aquiring Pokemon", 6, "EV Training", 5, "Arena Fighting", 4, "Breeding", 3, "Reorganizing Pokemon Team", 2, "Random Battle", 1, "Relaxing", 0 ]
    
    @all_routes = []
    
    Dir["files/routes/*.*"].each do |file|
      @all_routes << Route.new(file)
    end
  end
  
  before :each do
    @island = Island.new("Kanto")
  end
  
  describe "#new" do
    it "takes one parameter and returns an Island object" do
      @island.should be_an_instance_of Island
    end
    
    it "has a name" do
      @island.name.should == "Kanto"
    end
    
    it "has loaded all routes" do      
      @island.routes.size.should == @all_routes.size
    end
    
    it "has three trainers" do
      @island.trainers.size.should == 3
    end
    
    it "has three roadblocks" do
      @island.roadblocks.size.should == 3
    end
    
    it "can check a specific route" do
      @island.route("route_1").name.should == "route_1"
    end
    
    it "can pulse through each trainer and cause them to take an action" do
      trainer_one_action = @island.trainers[1].current_action
      @island.pulse
      @island.trainers[1].current_action.should_not == trainer_one_action
    end
    
  end
end