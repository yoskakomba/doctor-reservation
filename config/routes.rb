Rails.application.routes.draw do
    root 'pages#home'
    
    get '/home', to: 'pages#home'
    #get '/reservations', to: 'reservations#index'
    #get '/reservations/new', to: 'reservations#new', as: 'new_reservation'
    #get '/reservations/:id/edit', to: 'reservations#edit', as: 'edit_reservations'
    #patch '/reservations/:id', to: 'reservations#update'
    #get 'reservations/:id', to: 'reservations#show', as: 'reservation'
    #delete '/reservations/:id', to: 'reservations#destroy'
    
    resources :reservations
end
