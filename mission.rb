module Mission

	@adjectives = []
	@nouns = []
	@colors = []
	@animals = []
	@mission_grammars = []

	def Mission.read_files()
		@adjectives.clear
		adjective_file = File.new('adjectives.txt', "r")
		while (line = adjective_file.gets)
  			@adjectives << line.chomp
		end
		adjective_file.close

		@nouns.clear
		noun_file = File.new('nouns.txt', "r")
		while (line = noun_file.gets)
  			@nouns << line.chomp
		end
		noun_file.close

		@colors.clear
		color_file = File.new('colors.txt', "r")
		while (line = color_file.gets)
  			@colors << line.chomp
		end
		color_file.close

		@animals.clear
		animal_file = File.new('animals.txt', "r")
		while (line = animal_file.gets)
  			@animals << line.chomp
		end
		animal_file.close


		@mission_grammars.clear
		grammar_file = File.new('grammars.txt', "r")
		while (line = grammar_file.gets)
  			@mission_grammars << line.chomp.split('|')

		end
		grammar_file.close
	end

	def Mission.get_adj()
		if @adjectives.empty?
			read_files()
		end
		
		adj = @adjectives.sample
		adj = adj.split('|')
		adj = [adj[0], adj[1..-1]]
		return adj
	end

	def Mission.get_noun(bad_nouns = [])
		if @nouns.empty?
			read_files()
		end
		
		try_again = true
		while try_again
			noun = @nouns.sample
			if ! bad_nouns.include? noun
				try_again = false
			end
		end
		return noun
	end

	def Mission.get_color()
		if @colors.empty?
			read_files()
		end
		return @colors.sample
	end

	def Mission.get_animal()
		if @animals.empty?
			read_files()
		end
		return @animals.sample
	end

	def Mission.get_name()
		adj, bad_nouns = get_adj();
		noun = get_noun(bad_nouns)

		adj2 = adj
		noun2 = noun
		while adj2[0] == adj[0] || noun2 == noun
			adj2, bad_nouns = get_adj();
			noun2 = get_noun(bad_nouns)
		end

		color = get_color()
		animal = get_animal()

		name = ""
		case rand(1..100)
		when 1..10
			name += "Project "
		when 11..20
			name += "Operation "
		end

		total_prob = 0
		@mission_grammars.each{|grammar| 
			grammar[0] = grammar[0].to_i
			total_prob += grammar[0]
		}
		chance = rand(1..total_prob)
		@mission_grammars.each{|grammar|
			if chance < grammar[0]
				name += eval(grammar[1])
				break
			end
			chance -= grammar[0]
		}

		return name
	end
end