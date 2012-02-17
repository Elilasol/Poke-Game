require 'spec_helper'

describe Pokemon_Hash do
  before :all do
    @hash = Pokemon_Hash.read("./files/etc/pokemon.txt")
    @hash1 = {"Bulbasaur"=>{"DEX"=>1, "NAME"=>"Bulbasaur", "CAP"=>45, "BASEXP"=>64, "HATCH"=>20, "GENDER"=>1, "HP"=>45, "ATK"=>49, "DEF"=>49, "SPATK"=>65, "SPDEF"=>65, "SPEED"=>45, 
      "GROWTH"=>4, "EVOL_FROM"=>1, "EVOL_TO"=>2, "EVOL_TRIG"=>1, "EVOL_LEVEL"=>16, "EVOL_ITEM"=>"nil", "EVOL_GENDER"=>"nil", "EVOL_LOC"=>"nil", "EVOL_HELD"=>"nil", "TYPE1"=>12, "TYPE2"=>4, 
      "EGG1"=>1, "EGG2"=>7}}
    hash2 = {"Ivysaur"=>{"DEX"=>2, "NAME"=>"Ivysaur", "CAP"=>45, "BASEXP"=>141, "HATCH"=>20, "GENDER"=>1, "HP"=>60, "ATK"=>62, "DEF"=>63, "SPATK"=>80, "SPDEF"=>80, "SPEED"=>60, 
      "GROWTH"=>4, "EVOL_FROM"=>2, "EVOL_TO"=>3, "EVOL_TRIG"=>1, "EVOL_LEVEL"=>32, "EVOL_ITEM"=>"nil", "EVOL_GENDER"=>"nil", "EVOL_LOC"=>"nil", "EVOL_HELD"=>"nil", "TYPE1"=>12, "TYPE2"=>4, 
      "EGG1"=>1, "EGG2"=>7}}
    @hash1.merge!(hash2)
  end
  
  describe "#read" do
    it "returns a hash of hashes with the primary key being name" do
      
      @hash["Ivysaur"].should == @hash1["Ivysaur"]
    end
    
    it "reads each entry as different" do
      
      @hash["Ivysaur"].should_not == @hash1["Bulbasaur"]
    end
    
  end
end