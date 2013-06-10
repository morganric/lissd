Lissd::Application.routes.draw do
  


resources :lists do
  	  resources :items
end

match 'lists/:list_id/items/:id/complete' => 'items#complete', :as => :complete_item
match 'lists/:list_id/items/:id/incomplete' => 'items#incomplete', :as => :incomplete_item
match 'lists/:list_id/items/:id/remove' => 'items#remove', :as => :remove_item
match 'show/:id' => 'user#show'

  authenticated :user do
    root :to => 'lists#index'
  end
  root :to => "lists#index"
  devise_for :users
  resources :users
end