class AddPlantAgeInDaysToGrowLogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :grow_logs, :plant_age_in_days, :integer, null: false
  end
end
