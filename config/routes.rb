Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    post '/auditions' => 'auditions#create'
    get '/auditions' => 'auditions#index'
    get '/auditions/:id' => 'auditions#show'

    post '/shows' => 'shows#create'
    
    get '/time_slots/:id' => 'time_slots#show'
    patch '/time_slots/:id' => 'time_slots#update'
    delete '/time_slots/:id' => 'time_slots#destroy'
  end
end
