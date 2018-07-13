Rails.application.routes.draw do
  
  
  resources :pets
  resources :shelters
  resources :users, :only => [:new, :create]
  
  get '/login' => 'session#new' # login form
  post '/login' => 'session#create' #  performs login and authenticates password
  delete '/login' => 'session#destroy' # logout

  root :to => "pets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
