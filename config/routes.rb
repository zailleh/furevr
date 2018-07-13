Rails.application.routes.draw do
  
  resource :pets
  resource :shelters
  resource :users, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
