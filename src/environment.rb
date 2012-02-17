require 'pokemon_hash'
require 'gamewindow'

module Environment
  #Hash of all pokemon
  POKEMON_HASH = Pokemon_Hash.read("files/etc/pokemon.txt")
  
  #Hash of all trainers
  TRAINER_HASH = Pokemon_Hash.read("files/trainers/trainers.txt")
  
  #Hash of pokemon types
  TYPE_HASH = Pokemon_Hash.read("files/etc/types.txt")

  #For making decisions when both are wanted by the trainer.
  DECISION_IMPORTANCE = Hash["Heal", 9, "Fight Trainer", 8, "Fight Gym", 7, "Aquiring Pokemon", 6, "EV Training", 5, "Arena Fighting", 4, "Breeding", 3, "Reorganizing Pokemon Team", 2, "Random Battle", 1, "Relaxing", 0 ]  

  #Main window
  WINDOW = GameWindow.new
  WINDOW.show
end

