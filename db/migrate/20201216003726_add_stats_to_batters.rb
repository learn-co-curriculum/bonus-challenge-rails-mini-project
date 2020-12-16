class AddStatsToBatters < ActiveRecord::Migration[5.0]
  def change
    add_column :batters, :pa, :integer
    add_column :batters, :bb, :integer
    add_column :batters, :hbp, :integer
    add_column :batters, :h, :integer
    add_column :batters, :d, :integer
    add_column :batters, :t, :integer
    add_column :batters, :hr, :integer
    add_column :batters, :so, :integer
    add_column :batters, :avg, :float
    add_column :batters, :obp, :float
    add_column :batters, :slg, :float
    add_column :batters, :ops, :float
  end
end
