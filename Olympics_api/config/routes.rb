Rails.application.routes.draw do
  
  #namespace for API verisioning to allow for changes without impacting existing clients.
  namespace :v1 do
    resources :events
  end

end
