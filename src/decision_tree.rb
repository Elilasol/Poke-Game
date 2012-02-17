require 'battle'

class Decision_Tree
  
  def initialize(trainer, trainer_array)
    @decisions = Environment::DECISION_IMPORTANCE
    
    
    @trainers = trainer_array
    
    decide(trainer)
    perform(trainer)
  end
  
  def perform(trainer)
    
    decision_levels = nil
    
    i = 7
    while decision_levels == nil do
      
      decision_levels_check = trainer.decision.select{|k, v| v == i}
      if decision_levels_check.length >= 1
        decision_levels = decision_levels_check
      end
      i -= 1
    end
    
    if decision_levels.length > 1
      perform_action(dilemma(decision_levels), trainer)
    else perform_action(decision_levels.keys[0].to_s, trainer)
    end
    
  end
  
  def perform_action(action, trainer)
    
    #TODO still need to add: gym fighting, trainer fighting, catching new pokemon, 
    #moving the team around to have a new leadoff fighter. Removing the hack used to display
    #the current action of the trainer is also nessasary, and should be done sooner rather 
    #than later.

    #Long TODO, ev training, breeding, and the arena.
   
    #Every action increases a trainer's desire for a vacation. Eventually they will take a 
    #day off. Either from a poke center visit for healing, or just a break from the action.
    case action
      when "Heal"
      trainer.current_action_set(trainer.name.to_s + " healing their pokemon.")
      trainer.pokemon[0].heal
      trainer.decision["Relaxing"] = 0
      trainer.decision["Random Battle"] = 3
      
      when "Fight Gym"
      trainer.current_action_set(trainer.name.to_s + " fighting a gym for a badge.")
      trainer.decision["Relaxing"] += 3
      
      when "Aquiring Pokemon"
      trainer.current_action_set(trainer.name.to_s + " Locating and catching a pokemon.")
      trainer.decision["Relaxing"] += 1
      
      when "EV Training"
      trainer.current_action_set(trainer.name.to_s + " Training thier pokemon to be the best!")
      trainer.decision["Relaxing"] += 1
      
      when "Arena Fighting"
      trainer.current_action_set(trainer.name.to_s + " Battling in the arena matches!")
      trainer.decision["Relaxing"] += 2
      
      when "Reorganizing Pokemon Team"
      trainer.current_action_set(trainer.name.to_s + " Switching thier pokemon around.")
      trainer.decision["Relaxing"] += 1
      
      when "Relaxing"
      trainer.current_action_set(trainer.name.to_s + " Taking a break and resting")
      trainer.decision["Relaxing"] = 0
      
      when "Random Battle"
      trainer.current_action_set(trainer.name.to_s + " Fighting in a random battle!")
      Battle.new(trainer, "Wild Pokemon")
      trainer.decision["Relaxing"] += 1
    end
    
  end
  
  def dilemma(decision_levels)
    
    dilemma_decision = decision_levels.keys[0]
    
    1.upto(decision_levels.length) do |i|
      if @decisions[decision_levels.keys[i].to_s].to_i > @decisions[dilemma_decision.to_s].to_i
        dilemma_decision = decision_levels.keys[i]
      end
    end
    
    dilemma_decision
  end
  
  #Because health can vary wildly between battles, a merge works better, setting it instantly
  #to whatever the danger level is, rather than + or - to its current level.
  def decide(trainer)
    trainer.decision.merge!(pokemon_status(trainer))
  end
  
  def pokemon_status(trainer)
    
    percent = trainer.pokemon[0].hp_percent * 100
    
    #The percent of the pokemon's health, modified by the trainers willingness to 
    #take risks. Mod of +- 50% of what the current health is, so a pokemon at 40% health
    #on a super risky trainer, would be treated as a pokemon at 60% health for the average
    #trainer.
    trainer_opinion = percent * trainer.risk_mod
    
    heal_hash = Hash.new
    
    #if a pokemon party is full health, dont worry about healing. Otherwise... 
    if percent < 100
      
      case trainer_opinion 
        when 85..100
        heal_hash["Heal"] = 1
        when 70..84
        heal_hash["Heal"] = 2
        when 55..69
        heal_hash["Heal"] = 3
        when 45..54
        heal_hash["Heal"] = 4
        when 30..44
        heal_hash["Heal"] = 5
        when 15..29
        heal_hash["Heal"] = 6
        when 0..14
        heal_hash["Heal"] = 7	
      end
      
    else heal_hash["Heal"] = 0
    end
    
    heal_hash
  end
  
end
