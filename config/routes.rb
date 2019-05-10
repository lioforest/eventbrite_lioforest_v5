Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users, only: [:show]
  resources :attendances, only: [:new, :create, :index]
  resources :charges
  post "events/subscribe/:id", to: "events#subscribe",  as: 'events_subscribe' 


 root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
end
