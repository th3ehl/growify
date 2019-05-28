class GrowLog < ApplicationRecord
	belongs_to :plant

	after_create :update_plant

private

	def update_plant
		plant = self.plant.update_attributes(
			days_old: self.plant_age_in_days + 1,
			height: self.plant.calculate_height,
		)

	end
	
end