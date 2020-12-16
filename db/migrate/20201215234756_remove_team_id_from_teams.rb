class RemoveTeamIdFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :team_id, :integer
  end
end
