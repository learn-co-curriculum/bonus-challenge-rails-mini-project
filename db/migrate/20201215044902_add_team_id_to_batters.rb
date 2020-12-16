class AddTeamIdToBatters < ActiveRecord::Migration[5.0]
  def change
    add_column :batters, :team_id, :integer
  end
end
