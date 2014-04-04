Libreconf::Application.routes.draw do
  resources :workshops

  resources :speakers

  devise_for :users

  resources :abstract_statuses

  resources :sponsor_types

  resources :sponsors

  resources :abstracts

  get "home/index"
  
  root :to => 'home#index'

  #ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
