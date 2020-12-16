class Batter < ApplicationRecord
    has_many :plate_appearances
    belongs_to :team, class_name: "Team", foreign_key: :api_team_id
end
