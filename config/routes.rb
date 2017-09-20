Rails.application.routes.draw do
  # This part generates the routes that we'll use for the API
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
    	resources :edificios
    	resources :personas
    	resources :albergues
    end
	end
end
