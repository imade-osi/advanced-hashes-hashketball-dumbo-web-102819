require "pry"

def game_hash 
  
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      { :players_name => "Alan Anderson", 
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      { :players_name =>"Reggie Evans", 
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      { :players_name =>"Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      { :players_name =>"Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      { :players_name =>"Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      } 
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [ 
      { :players_name =>"Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      { :players_name =>"Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      { :players_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      { :players_name =>"Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      { :players_name =>"Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
     ]
    }
  }

end 



def num_points_scored(player_name)
  game_hash.each do |team_location, team_data|
    
    team_data.each do |attribute, data| 
    if attribute == :players
        data.each do |player| 
          if player[:players_name] == player_name
          
           return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
   game_hash.each do |team_location, team_data|
    
    team_data.each do |attribute, data| 
    if attribute == :players
        data.each do |player| 
          if player[:players_name] == player_name
          
           return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team_location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end 


def team_names
  game_hash.map do |team_location, team_data|
   team_data[:team_name]
  
  end
end 



def player_numbers(team_name)
  
  nums = []
  
  game_hash.each do |team_location, team_data|
    if team_data[:team_name] == team_name 
      
      team_data.each do |attributes, data| 
        if attributes == :players 
           data.each do |player| 
           nums << player[:number]
          end 
        end 
      end 
    end 
  end 
  nums
end 

def player_stats(player_name)
   stats = {}
   
    game_hash.each do |team_location, team_data|
      team_data.each do |attributes, data| 
        if attributes == :players
          data.each do |player| 
            if player [:players_name] == player_name
              stats = player.delete_if do |key, value| 
                key == :players_name
              end 
            end 
          end 
        end 
      end 
    end 
    stats
end

def big_shoe_rebounds
  rebounds = 0 
  prev_shoe = 0     
  
     game_hash.each do |team_location, team_data|
       team_data.each do |attributes, data| 
         if attributes == :players 
           data.each do |player| 
             if player[:shoe] > prev_shoe
               prev_shoe = player[:shoe]
               rebounds = player[:rebounds]
             end   
           end 
         end 
       end 
     end 
     
  rebounds
end 

def most_points_scored
  points = 0 
  name = ""     
  
     game_hash.each do |team_location, team_data|
       team_data.each do |attributes, data| 
         if attributes == :players 
           data.each do |player| 
             if player[:points] > points
               points = player[:points]
               name = player[:players_name]
             end   
           end 
         end 
       end 
     end 
     
  name
end 

def winning_team
  team_one = 0 
  team_two = 0 
  
   game_hash.each do |team_location, team_data|
     
    if team_location == :home 
       team_data.each do |attributes, data| 
         if attributes == :players 
           data.each do |player| 
             team_one += player[:points]
             end   
           end 
         end 
       end 
    
   if team_location == :away 
       team_data.each do |attributes, data| 
          if attributes == :players 
           data.each do |player| 
             team_two += player[:points]
             end   
           end 
         end 
       end 
   end
 
 
if team_one > team_two 
   return game_hash[:home][:team_name]
 else 
   return game_hash[:away][:team_name]
end
 
end  

def player_with_longest_name
  name = ""     
  
     game_hash.each do |team_location, team_data|
       team_data.each do |attributes, data| 
         if attributes == :players 
           data.each do |player| 
             if player[:players_name].length > name.length
               name = player[:players_name]
             end   
           end 
         end 
       end 
     end 
     
  name
end 

  
def long_name_steals_a_ton?
 steals = 0 
  name = ""     
  
     game_hash.each do |team_location, team_data|
       team_data.each do |attributes, data| 
         if attributes == :players 
           data.each do |player| 
             if player[:steals] > steals
               steals = player[:steals]
               name = player[:players_name]
             end   
           end 
         end 
       end 
     end 
     
   if player_with_longest_name == name
     true 
   else 
     false 
   end
  
end 