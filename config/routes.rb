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
    patch '/auditions/:id' => 'auditions#update'
    delete '/auditions/:id' => 'auditions#destroy'

    get '/shows' => 'shows#index'
    post '/shows' => 'shows#create'
    get '/shows/:id' => 'shows#show'
    patch '/shows/:id' => 'shows#update'
    delete '/shows/:id' => 'shows#destroy'
    
    get '/time_slots/:id' => 'time_slots#show'
    patch '/time_slots/:id' => 'time_slots#update'
    delete '/time_slots/:id' => 'time_slots#destroy'
  end
end
