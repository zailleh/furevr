Rails.application.routes.draw do
  
  
  # misc routes, may be candidates for removal
  get 'admin/index'
  resources :animal_types
  resources :breeds
  resources :shelter_types
  
  
  # routes for pets
  get 'pets/search' => 'pets#search', :as => :search
  get 'pets/:id/watch_list' => 'pets#watchlist', :as => :watchlist
  delete 'pets/:id/watch_list' => 'pets#watchlist_remove'
  resources :pets
  
  # routes for shelters
  get 'shelters/:id/hours' => 'shelters#hours', :as => :shelter_hours
  post 'shelters/:id/hours' => 'shelters#update_hours'
  resources :shelters

  # routes for users
  resources :users, :only => [:new, :create, :show]

  # routes for session  
  get '/login' => 'session#new' # login form
  post '/login' => 'session#create' #  performs login and authenticates password
  delete '/login' => 'session#destroy' # logout

  get '/admin' => 'admin#index' #admin controls

  root :to => "pets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
