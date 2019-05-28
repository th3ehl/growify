class Tomato < Plant
	TRAILING_GROW_PERIOD = 7
	MAX_DAILY_GROWTH = 0.03

	def calculate_height
		grow_logs = trailing_grow_logs(TRAILING_GROW_PERIOD)
		total_sun_lamp_hrs = grow_logs.pluck(:sunlamp_hrs).inject(0){ |sum,x| sum + x }
		avg_sun_lamp_hrs = total_sun_lamp_hrs / TRAILING_GROW_PERIOD

		total_water_inches = grow_logs.pluck(:water_inches).inject(0){ |sum,x| sum + x }
		
		if avg_sun_lamp_hrs > 6
			sunlamp_score = 0
		elsif avg_sun_lamp_hrs > 4
			sunlamp_score = 1
		elsif avg_sun_lamp_hrs < 4
			sunlamp_score = 0.5
		end

		if total_water_inches > 3
			water_score = 0
		elsif total_water_inches > 1
			water_score = 1
		elsif total_water_inches < 4
			water_score = 0.5
		end

		blended_score = (sunlamp_score + water_score) / 2

		new_height = height + blended_score * MAX_DAILY_GROWTH
		new_height
	end

	# def calculate_health_score
	# end

	# def calculate_total_yield
	# end
	
end