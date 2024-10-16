Rails.application.routes.draw do
  root 'pages#home'
  
  get 'about', to: 'pages#about'
  get 'projects', to: 'pages#projects'
  get 'contact', to: 'pages#contact'

  # Rutas para mensajes y contactos
  resources :messages, only: [:create]
  resources :contacts, only: [:new, :create]
end
