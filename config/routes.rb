Rails.application.routes.draw do
  
	namespace :api, defaults: { format: :json }  do
		namespace :v1 do 
			resources :users, only: [:create]
			resources :sessions, only: [] do 
				collection { get :get_current_user }
			end
			resources :grow_logs, only: [:create]
		end
	end

end
