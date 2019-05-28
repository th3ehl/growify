class CreateGrowLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :grow_logs do |t|
    	t.integer :plant_id, null: false
    	t.float :sunlamp_hrs, null: false
    	t.float :water_inches, null: false

    	t.timestamps
    end

    add_index :grow_logs, :plant_id
  end
end
