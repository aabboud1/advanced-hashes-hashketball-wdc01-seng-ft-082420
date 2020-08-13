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
def points_of_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats][:points]
      end
    end
  end
end

p points_of_player("Michael Giordan", game)

# Return the shoe size for any player:
#
def shoe_size_of_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:shoe_size]
      end
    end
  end
end

p shoe_size_of_player("King George", game)

# Return both colors for any team:
#
def team_colors(team_name, game)
  game.each do |team, team_hash|
    if team_hash[:name] == team_name
      return (team_hash[:colors].collect do |color|
        color
      end)
    end
  end
end

p team_colors("The Ragin' Cajuns", game)

# Return both teams names:
#
def team_names(game)
  game.collect do |team, team_hash|
    team_hash[:name]
  end
end

p team_names(game)

# Return all the player numbers for a team:
#
def all_team_players(team_name, game)
  game.each do |team, team_hash|
    if team_hash[:name] == team_name
      return (team_hash[:players].collect do |player, player_hash|
        player_hash[:name]
      end)
    end
  end
end

p all_team_players("The Ragin' Cajuns", game)

# Return all the stats for a player:
#
def all_stats_for_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats]
      end
    end
  end
end

p all_stats_for_player("Bill Nye", game)

# Return the rebounds for the player with the largest shoe size
#
def rebounds_for_largest_shoe_size(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:shoe_size] > max_player[:shoe_size]
    end
  end

  max_player[:stats][:rebounds]
end

p rebounds_for_largest_shoe_size(game)

# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?
#
def player_with_most_points(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:stats][:points] > max_player[:stats][:points]
    end
  end

  max_player[:name]
end

p player_with_most_points(game)

# Which team has the most points?
#
def team_with_most_points(game)
  max_team = nil
  game.each do |team, team_hash|
    sum = 0
    team_hash[:players].each do |player, player_hash|
      sum += player_hash[:stats][:points]
    end

    team_hash[:sum] = sum
    max_team ||= team_hash
    max_team = team_hash if team_hash[:sum] > max_team[:sum]
  end

  max_team[:name]
end

p team_with_most_points(game)

# Which player has the longest name?
#
def player_with_longest_name(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:name].length > max_player[:name].length
    end
  end

  max_player[:name]
end

p player_with_longest_name(game)

# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals:
#
def player_with_most_steals_and_name(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:stats][:steals] > max_player[:stats][:steals]
    end
  end

  max_player[:name] == player_with_longest_name(game)
end

p player_with_most_steals_and_name(game)