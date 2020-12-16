class PlateAppearance < ApplicationRecord
    belongs_to :batter
    belongs_to :pitcher

    def pset 
        {
        bb: 85,
        hbp: 95,
        single: 234,
        double: 279,
        triple: 285,
        homerun: 319,
        lineout: 413,
        groundout: 606,
        flyout: 771,
        k: 1000
        }
    end
    
    def outcome
        rand = rand(1000)
        pset.reject {|k, v| rand > v }.min_by {|k,v|v}.first.upcase
    end

    def on_base?
        odds_b = @batter.obp / (@batter.obp - 1) * -1
        odds_p = @pitcher.obp / (@pitcher.obp - 1) * -1
        odds = (odds_b * odds_p)
end
