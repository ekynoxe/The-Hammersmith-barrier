Hambarrier::Application.routes.draw do

  namespace :admin do
    resources :statuses
  end

  resources :statuses
  match ':statuses(/:year/:month/:day)' => 'statuses#show'
  
  root :to => 'home#index'
  match "*path", :to => 'home#index'
end
