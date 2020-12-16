class Team < ApplicationRecord
    has_many :batters, primary_key: :api_team_id
    has_many :pitchers, primary_key: :api_team_id
    has_many :plate_appearances, through: :batters
    has_many :plate_appearances, through: :pitchers
end
