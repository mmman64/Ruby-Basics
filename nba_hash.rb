=begin

    1. Build a hash from some NBA player data

    2. Build a method, num_points_scored that takes in an argument of a player's
    name and returns the number of points scored for that player.

    3. Build a method, shoe_size, that takes in an argument of a player's name and
    returns the shoe size for that player.

    4. Build a method, team_names, that operates on the game hash to return an
    array of the team names.

    5. Build a method, player_numbers, that takes in an argument of a team name
    and returns an array of the jersey number's for that team.

    6. Build a method, player_stats, that takes in an argument of a player's name
    and returns a hash of that player's stats.

    7. Build a method, big_shoe_rebounds, that will return the number of rebounds
    associated with the player that has the largest shoe size.

    8. Which player has the most points? Call the method most_points_scored.

    9. Which team has the most points? Call the method winning_team.

    10. Which player has the longest name? Call the method player_with_longest_name.

    11. Write a method that returns true if the player with the longest name had
    the most steals. Call the method long_name_steals_a_ton?.

=end

def game_hash
  h = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          },
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          "Bismack Biyombo" => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          "Kemba Walker" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          },
        }
      ]
    }
  }
end

# Create a hash of home players, away players, and both combined
def players_hash(team_name)
    players1 = game_hash[:home][:players]
    players2 = game_hash[:away][:players]
    arr_players = players1 + players2
    all_players = arr_players[0].merge(arr_players[1])

    result = {
      "Brooklyn Nets" => players1[0],
      "Charlotte Hornets" => players2[0],
      "All" => all_players
    }

    # Lookup team_name passed in in above hash
    result[team_name]
end

def num_points_scored(player_name)
  all_player_info = players_hash("All")
  return all_player_info[player_name][:points]
end

def shoe_size(player_name)
  all_player_info = players_hash("All")
  return all_player_info[player_name][:shoe]
end

def team_colors(team_name)
  game_hash.map do |_, val|
    if val[:team_name] == team_name
       return val[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.map do |_, val|
    teams << val[:team_name]
  end
  teams
end

def player_numbers(team_name)
  jersey_numbers = []
  players = players_hash(team_name)
  players.each do |key, value|
      jersey_numbers << players[key][:number]
  end
  jersey_numbers
end

def player_stats(name)
  all_stats = players_hash("All")
  return all_stats[name]
end

def big_shoe_rebounds
  players = players_hash("All")
  shoe_info = players.map do |k, v|
    player_name = k
    player_shoe_size = v[:shoe]
    Hash[:name => player_name, :size => player_shoe_size]
  end
  biggest_shoe = shoe_info.sort_by { |obj| obj[:size] }.last
  biggest_shoe_name = biggest_shoe[:name]
  return players[biggest_shoe_name][:rebounds]
end

def most_points_scored
  players = players_hash("All")
  score_info = players.map do |k, v|
    player_name = k
    player_score_total = v[:points]
    Hash[:name => player_name, :points => player_score_total]
  end
  highest_score = score_info.sort_by { |obj| obj[:points] }.last
  return highest_score_player = highest_score[:name]
end

def winning_team
  bn_players = players_hash("Brooklyn Nets")
  ch_players = players_hash("Charlotte Hornets")
  bn_players_total_points = 0
  ch_players_total_points = 0
  bn_players.each { |k, v| bn_players_total_points += v[:points] }
  ch_players.each { |k, v| ch_players_total_points += v[:points] }
  bn_players_total_points > ch_players_total_points ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  players = players_hash("All")
  name_count = 0
  name = ""
  players.each do |k, v|
    name = k if k.size >= name.size
  end
  name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  players = players_hash("All")
  steal_count = 0
  name = ""
  players.each do |k, v|
    if v[:steals] > steal_count
      steal_count = v[:steals]
      name = k
    end
  end
  name == longest_name ? true : false
end
