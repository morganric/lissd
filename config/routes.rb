Lissd::Application.routes.draw do
  


resources :lists do
  	  resources :items
  	  get 'page/:page', :action => :index, :on => :collection
end

match 'lists/:id/publish' => 'lists#publish', :as => :publish_list
match 'lists/:id/private' => 'lists#private', :as => :private_item

match 'lists/:list_id/items/:id/complete' => 'items#complete', :as => :complete_item
match 'lists/:list_id/items/:id/incomplete' => 'items#incomplete', :as => :incomplete_item
match 'lists/:list_id/items/:id/remove' => 'items#remove', :as => :remove_item
match 'lists/:list_id/items/:id/' => 'items#show', :as => :show_item

match 'users/:id' => 'users#show'

  authenticated :user do
    root :to => 'lists#index'
  end
  root :to => "lists#index"
  devise_for :users
  resources :users
end