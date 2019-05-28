class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
    	t.integer :user_id, null: false
    	t.string :type, null: false
    	t.integer :days_old, null: false, default: 0
    	t.integer :total_yield, null: false, default: 0
    	t.integer :height, null: false, default: 0
    	t.integer :health_score, null: false, default: 0

    	t.timestamps
    end

    add_index :plants, :user_id
  end
end
