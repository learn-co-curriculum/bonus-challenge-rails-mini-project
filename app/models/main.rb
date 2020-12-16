class Main

    def self.get_players
        players = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code=%27mlb%27&active_sw=%27Y%27&name_part=%27%25%27").parse_json
        players["search_player_all"]["queryResults"]["row"].each do |p|
            if p["position"] == "P"
                Pitcher.create(name: p["name_display_first_last"], tier: rand(1...4), team_id: p["team_id"])
            else
                Batter.create(name: p["name_display_first_last"], tier: rand(1...4), team_id: p["team_id"])
            end
        end
    end

    def self.get_teams
        teams = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2017'").parse_json
        teams["team_all_season"]["queryResults"]["row"].each do |p| 
            Team.create(name: p["name_display_full"], api_team_id: p["team_id"]) 
        end
    end
end