Rails.application.routes.draw do
  
  
  
  get 'admin/index'
  resources :animal_types
  resources :breeds
  resources :shelter_types
  
  
  resources :pets
  get 'pets/:id/watch_list' => 'pets#watchlist', :as => :watchlist
  delete 'pets/:id/watch_list' => 'pets#watchlist_remove'
  
  
  resources :shelters
  resources :users, :only => [:new, :create, :show]
  
  get '/login' => 'session#new' # login form
  post '/login' => 'session#create' #  performs login and authenticates password
  delete '/login' => 'session#destroy' # logout

  get '/admin' => 'admin#index' #admin controls

  root :to => "pets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
