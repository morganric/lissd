Lissd::Application.routes.draw do
  


resources :lists do
  	  resources :items
end

match 'lists/:list_id/items/:id/complete' => 'items#complete', :as => :complete_item
match 'show/:id' => 'user#show'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "lists#index"
  devise_for :users
  resources :users
end