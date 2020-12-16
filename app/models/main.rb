class Main

    def self.get_players
        players = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code=%27mlb%27&active_sw=%27Y%27&name_part=%27%25%27").parse_json
        players["search_player_all"]["queryResults"]["row"].each do |p|
            id = p["player_id"]
            puts id
            if p["position"] == "P"
                player = Pitcher.create(name: p["name_display_first_last"], team_id: p["team_id"])
                stats  = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.sport_pitching_tm.bam?league_list_id='mlb'&game_type='R'&season='2019'&player_id='#{id}'").parse_json
                if stats["sport_pitching_tm"]["queryResults"]["totalSize"] != "0" 
                    if stats["sport_pitching_tm"]["queryResults"]["row"].kind_of?(Array)
                        stats["sport_pitching_tm"]["queryResults"]["row"].each do |stat|
                            player.tbf = player.tbf.to_i + stat["tbf"].to_i
                            player.bb = player.bb.to_i + stat["bb"].to_i
                            player.hbp = player.hbp.to_i + stat["hb"].to_i
                            player.h = player.h.to_i + stat["h"].to_i
                            player.d = player.d.to_i + stat["db"].to_i
                            player.t = player.t.to_i + stat["tr"].to_i
                            player.hr = player.hr.to_i + stat["hr"].to_i
                            player.so = player.so.to_i + stat["so"].to_i
                            player.avg = stat["avg"].to_f
                            player.obp = stat["obp"].to_f
                            player.slg = stat["slg"].to_f
                            player.ops = stat["ops"].to_f
                            player.era = stat["era"].to_f
                            player.w = player.w.to_i + stat["w"].to_i
                            player.l = player.l.to_i + stat["l"].to_i
                        end
                    else
                        
                        player.tbf = stats["sport_pitching_tm"]["queryResults"]["row"]["tbf"].to_i
                        player.bb = stats["sport_pitching_tm"]["queryResults"]["row"]["bb"].to_i
                        player.hbp = stats["sport_pitching_tm"]["queryResults"]["row"]["hb"].to_i
                        player.h = stats["sport_pitching_tm"]["queryResults"]["row"]["h"].to_i
                        player.d = stats["sport_pitching_tm"]["queryResults"]["row"]["db"].to_i
                        player.t = stats["sport_pitching_tm"]["queryResults"]["row"]["tr"].to_i
                        player.hr = stats["sport_pitching_tm"]["queryResults"]["row"]["hr"].to_i
                        player.so = stats["sport_pitching_tm"]["queryResults"]["row"]["so"].to_i
                        player.avg = stats["sport_pitching_tm"]["queryResults"]["row"]["avg"].to_f
                        player.obp = stats["sport_pitching_tm"]["queryResults"]["row"]["obp"].to_f
                        player.slg = stats["sport_pitching_tm"]["queryResults"]["row"]["slg"].to_f
                        player.ops = stats["sport_pitching_tm"]["queryResults"]["row"]["ops"].to_f
                        player.era = stats["sport_pitching_tm"]["queryResults"]["row"]["era"].to_f
                        player.w = stats["sport_pitching_tm"]["queryResults"]["row"]["w"].to_i
                        player.l = stats["sport_pitching_tm"]["queryResults"]["row"]["l"].to_i
                    end 
                    player.save
                else
                    player.destroy
                end
            else
                player = Batter.create(name: p["name_display_first_last"], team_id: p["team_id"])
                stats  = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.sport_hitting_tm.bam?league_list_id='mlb'&game_type='R'&season='2019'&player_id='#{id}'").parse_json
                if stats["sport_hitting_tm"]["queryResults"]["totalSize"] != "0"
                    if stats["sport_hitting_tm"]["queryResults"]["row"].kind_of?(Array)
                        stats["sport_hitting_tm"]["queryResults"]["row"].each do |stat|
                            player.pa = player.pa.to_i + stat["tpa"].to_i
                            player.bb = player.bb.to_i + stat["bb"].to_i
                            player.hbp = player.hbp.to_i + stat["hbp"].to_i
                            player.h = player.h.to_i + stat["h"].to_i
                            player.d = player.d.to_i + stat["d"].to_i
                            player.t = player.t.to_i + stat["t"].to_i
                            player.hr = player.hr.to_i + stat["hr"].to_i
                            player.so = player.so.to_i + stat["so"].to_i
                            player.avg = stat["avg"].to_f
                            player.obp = stat["obp"].to_f
                            player.slg = stat["slg"].to_f
                            player.ops = stat["ops"].to_f
                        end
                    else
                        player.pa = stats["sport_hitting_tm"]["queryResults"]["row"]["tpa"].to_i
                        player.bb = stats["sport_hitting_tm"]["queryResults"]["row"]["bb"].to_i
                        player.hbp = stats["sport_hitting_tm"]["queryResults"]["row"]["hbp"].to_i
                        player.h = stats["sport_hitting_tm"]["queryResults"]["row"]["h"].to_i
                        player.d = stats["sport_hitting_tm"]["queryResults"]["row"]["d"].to_i
                        player.t = stats["sport_hitting_tm"]["queryResults"]["row"]["t"].to_i
                        player.hr = stats["sport_hitting_tm"]["queryResults"]["row"]["hr"].to_i
                        player.so = stats["sport_hitting_tm"]["queryResults"]["row"]["so"].to_i
                        player.avg = stats["sport_hitting_tm"]["queryResults"]["row"]["avg"].to_f
                        player.obp = stats["sport_hitting_tm"]["queryResults"]["row"]["obp"].to_f
                        player.slg = stats["sport_hitting_tm"]["queryResults"]["row"]["slg"].to_f
                        player.ops = stats["sport_hitting_tm"]["queryResults"]["row"]["ops"].to_f
                    end
                    player.save
                else
                    player.destroy
                end
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