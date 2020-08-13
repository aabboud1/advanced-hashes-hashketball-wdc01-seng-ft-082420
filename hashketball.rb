# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
	game_hash.each do |location, team_data|
		#iterating over the first layer
	team_data.each do |k, v|
		#iterating over the second layer
		if k == :players 
			v.each do |x|
			# iterated over array of players and then worked on value
			# binding.pry
			if x[:player_name] == player_name
			# if a players_name equal to name that passed return number of points.
			#finding player by name and returning points
			return x[:points]
			end
		  end
		end
	  end
	end
end

def shoe_size(player_name)
	game_hash.each do |location, team_data|
		#iterating over the first layer
	team_data.each do |k, v|
		#iterating over the second layer
		if k == :players 
			v.each do |x|
			if x[:player_name] == player_name
			return x[:shoe]
			end
		  end
		end
	  end
	end
end

def team_colors(team_name)
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team_name
			return team_data[:colors]
		end
	end
	# game_hash.each do |location, team_data|
	# #iterating over the first layer
	# team_data.each do |k, v|
	# 	if k == :colors 
	# || :team_name == name
	# 		# binding.pry
	# 		return v
	# 		end
	#   	end
	# end
end



def team_names
	team_names = []
	team_names << game_hash[:home][:team_name]
	team_names << game_hash[:away][:team_name]
	team_names

# 	game_hash.each do |location, team_data|
# 		# binding.pry
# 		if team_data == :team_name
# 			return team_data
# #  			binding.pry
# #  			return team_data
#  		end
#   	end
end

def player_numbers(team_name)
	jersey_number = []
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team_name
			# binding.pry
			team_data.each do |k, v|
				if k == :players
					v.each do |x|
					jersey_number << x[:number]
				# binding.pry
					end
				  end
				end
			end
		end
	jersey_number
end

def player_stats(player_name)
	game_hash.each do |location, team_data|
		team_data.each do |k, v|
			if k == :players
				v.each do |x|
					if x[:player_name] == player_name
						# binding.pry
						x.delete(:player_name)
						return x
					end
				end
			end
		end
	end
end

def big_shoe_rebounds
	largest_shoe_size = 0
	rebounds = 0

	game_hash.each do |location, team_data|
		team_data.each do |k, v|
			# k= attributes & v =team info
			if k == :players
				v.each do |x|
					# x equal to each player
					# binding.pry
					if x[:shoe] > largest_shoe_size
						# binding.pry
						largest_shoe_size = x[:shoe]
						rebounds = x[:rebounds]
						# need compare sizes
					end
				end
			end
		end
	end
	rebounds
end
