module Api::V1

	class GrowLogsController < ApiController

		def create
			grow_log = GrowLog.new(grow_log_params)

			if grow_log.save
				render json: grow_log.plant
			else
				render json: grow_log.errors.full_messages
			end
		end

	private
	
	  	def grow_log_params
	    	params.require(:grow_log).permit(
	    		:plant_id, 
	    		:sunlamp_hrs, 
	    		:water_inches, 
	    		:plant_age_in_days,
	    	)
	  	end  

	end
end