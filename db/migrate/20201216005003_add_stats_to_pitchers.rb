class AddStatsToPitchers < ActiveRecord::Migration[5.0]
  def change
    add_column :pitchers, :tbf, :integer
    add_column :pitchers, :bb, :integer
    add_column :pitchers, :hbp, :integer
    add_column :pitchers, :h, :integer
    add_column :pitchers, :d, :integer
    add_column :pitchers, :t, :integer
    add_column :pitchers, :hr, :integer
    add_column :pitchers, :so, :integer
    add_column :pitchers, :avg, :float
    add_column :pitchers, :obp, :float
    add_column :pitchers, :slg, :float
    add_column :pitchers, :ops, :float
    add_column :pitchers, :era, :float
    add_column :pitchers, :w, :integer
    add_column :pitchers, :l, :integer
  end
end
