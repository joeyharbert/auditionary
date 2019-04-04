Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
    post '/auditions' => 'auditions#create'
    post '/shows' => 'shows#create'
    get '/auditions' => 'auditions#index'
    get '/auditions/:id' => 'auditions#show'
  end
end
