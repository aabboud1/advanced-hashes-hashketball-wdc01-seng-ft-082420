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
	player_points = nil
	game_hash.each do |location, team_data|
		
		game_hash[location][:players].each do |player, stats|
            	if stats[:player_name] == player_name
            		player_points = stats[:points]
            	end
		end	
	end
	player_points.to_i
end

def shoe_size(player_name)
	player_shoe_size = nil
	game_hash.each do |location, team_data|
		
		game_hash[location][:players].each do |player, stats|
            	if stats[:player_name] == player_name
            		player_shoe_size = stats[:shoe]
            	end
		end	
	end
	player_shoe_size.to_i
end	

def team_colors(team_name)
	team_colors = nil
	game_hash.each do |location, location_data|
		if location_data[:team_name] == team_name
			team_colors = location_data[:colors]
		end
	end
	team_colors
end


def team_names
	team_names = []
	game_hash.each do |location, loc_data|
		team_names << loc_data[:team_name]
	end
	team_names
end

def player_numbers(team_name) 
	jersey_nums = []
	game_hash.each do |location, loc_data|

		if loc_data[:team_name] == team_name
			loc_data[:players].each do |player, stats|

				jersey_nums << stats[:number]
			end
		end
	end
	jersey_nums
end


def player_stats(player_name)
player_stats = nil
	game_hash.each do |location, loc_data|
		loc_data[:players].each do |player, stats|
			if stats[:player_name] == player_name
	           player_stats = stats
	           player_stats.delete(:player_name)
			end
		end
	end
	player_stats
end

def big_shoe_rebounds 
	biggest_shoe = 0
	rebounds = 0
	game_hash.each do |location, loc_data|
		loc_data[:players].each do |player, stats|
			if stats[:shoe] > biggest_shoe 
				biggest_shoe = stats[:shoe]
			end
			if stats[:shoe] == biggest_shoe
				rebounds = stats[:rebounds]
			end
		end
	end
	rebounds
end