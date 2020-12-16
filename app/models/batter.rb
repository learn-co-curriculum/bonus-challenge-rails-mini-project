class Batter < ApplicationRecord
    has_many :plate_appearances
    belongs_to :team, class_name: "Team", foreign_key: :api_team_id

    def average
        remove_leading_zero(self.avg)
    end

    def on_base_percentage
        remove_leading_zero(self.obp)
    end

    def slugging_percentage
        remove_leading_zero(self.slg)
    end

    def on_base_plus_slugging_percentage
        remove_leading_zero(self.ops)
    end

    def remove_leading_zero(stat)
        stat.to_s.sub!(/^0/, "")
    end
end
