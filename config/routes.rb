Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:update, :edit, :show]
  put '/groups/:id', to: 'groups#random', as: 'random'
  get '/showdata', :to => 'showdatas#index'
  #put '/random/:id', to: 'groups#random', as: 'random'
  root "groups#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
