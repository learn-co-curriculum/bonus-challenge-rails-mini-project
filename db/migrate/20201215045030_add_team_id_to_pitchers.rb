class AddTeamIdToPitchers < ActiveRecord::Migration[5.0]
  def change
    add_column :pitchers, :team_id, :integer
  end
end
