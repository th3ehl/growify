class ChangeHeightToFloat < ActiveRecord::Migration[5.2]
  def change
  	change_column :plants, :height, :float, default: 0, null: false
  end
end
