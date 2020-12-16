class AddApiTeamIdToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :api_team_id, :integers
  end
end
