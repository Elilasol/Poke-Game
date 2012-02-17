

class Import
	def initialize

	puts "Import attempt"

	require 'sqlite3'
	database = SQLite3::Database.new( "veekun-pokedex.sqlite" )
 
	#database.execute( "create table sample_table (id INTEGER PRIMARY KEY, sample_text TEXT, sample_number NUMERIC);" )
 
	#database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text1', 123)")
	#database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text2', 456)")
 
rows = Array.new



151.times do |i|
	pokemon = database.execute( "SELECT id, name, capture_rate, base_experience, hatch_counter  FROM pokemon WHERE id = :iteration;", "iteration" => i+1 )

	stats = database.execute( "SELECT base_stat FROM pokemon_stats WHERE pokemon_id = :iteration;", "iteration" => i+1)

	pokemon << stats
	rows << pokemon
	#rows << stats

	local_filename = "pokemon.txt"

	rows[i] = rows[i].to_s.delete "[],\""
	rows[i] = rows[i] + " "

	regex = "(.*?) "
	myarray = rows[i].scan(/(.*?) /)

	p myarray[0]

	if i == 0
		File.open(local_filename, 'w') {|f| f.write("#---\n") }
	end
		11.times do |i|
			case i
				when 0 
					stat = "DEX: "
				when 1
					stat = "NAME: "
				when 2
					stat = "CAP: "
				when 3
					stat = "BASEXP: "
				when 4
					stat = "HATCH: "
				when 5
					stat = "HP: "
				when 6
					stat = "ATK: "
				when 7
					stat = "DEF: "
				when 8
					stat = "SPATK: "
				when 9
					stat = "SPDEF: "
				when 10
					stat = "SPEED: "
			end
			clean_text = myarray[i].to_s.delete "[],\""
			File.open(local_filename, 'a') {|f| f.write(stat)}
			File.open(local_filename, 'a') {|f| f.write(clean_text + "\n") }
	end

	File.open(local_filename, 'a') {|f| f.write("---\n") }

end







	end
end

Import.new
