class Plant < ApplicationRecord
	belongs_to :user
	has_many :grow_logs

	def trailing_grow_logs(days)
		prior_cutoff = days_old - days
		grow_logs.where('plant_age_in_days IN (?)', (prior_cutoff...days_old).to_a)
	end

end