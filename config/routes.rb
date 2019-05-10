Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users, only: [:show]
  resources :attendances, only: [:new, :create, :index]
  resources :charges
  post 'events/attendances/:id', to: 'attendances#create',  as: 'create_attendance'
  post "events/subscribe/:id", to: "events#subscribe",  as: 'events_subscribe' 


 root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
end
