Hambarrier::Application.routes.draw do

  namespace :admin do
    resources :statuses
  end

  match '/statuses/:year/:month/:day', :to => 'statuses#show', :as => :day_statuses, :via => :get, :constraints => { :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/ }
  match '/statuses', :to => 'statuses#index', :as => :statuses, :via => :get
  
  root :to => 'home#index'
  match "*path", :to => 'home#index'
end
