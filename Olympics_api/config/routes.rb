Rails.application.routes.draw do

  # List all
  get '/event' => 'event#index'

  # Show one
  get '/event/:id' => 'event#show'

  # Create
  post '/events' => 'event#create'

  # Update
  patch '/event/:id' => 'event#update'

  #Delete/Destroy
  delete '/events/:id' => 'event#delete'

end
