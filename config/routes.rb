Lissd::Application.routes.draw do
  


resources :lists do
  	  resources :items
  	  get 'page/:page', :action => :index, :on => :collection
end

match 'lists/:id/publish' => 'lists#publish', :as => :publish_list
match 'lists/:id/private' => 'lists#private', :as => :private_list

match 'lists/:list_id/items/:id/complete' => 'items#complete', :as => :complete_item
match 'lists/:list_id/items/:id/incomplete' => 'items#incomplete', :as => :incomplete_item
match 'lists/:list_id/items/:id/remove' => 'items#remove', :as => :remove_item

get 'lists/:list_id/items/:item_id/edit' => 'items#edit', :as => :edit_item
post 'lists/:list_id/items/:item_id/edit' => 'items#update', :as => :update_item
match 'lists/:list_id/items/:id/' => 'items#show', :as => :show_item

# match 'users/:id' => 'users#show'

get 'tags/:tag', to: 'lists#index', as: :tag

  authenticated :user do
    root :to => 'lists#index'
  end
  root :to => "lists#index"
  devise_for :users
  resources :users
end