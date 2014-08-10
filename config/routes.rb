Libreconf::Application.routes.draw do

  resources :workshops, path: 'admin/workshops'

  resources :speakers, path: 'admin/speakers'

  devise_for :users

  resources :abstract_statuses, path: 'admin/abstract_statuses'

  resources :sponsor_types, path: 'admin/sponsor_types'

  resources :sponsors, path: 'admin/sponsors'

  resources :abstracts, path: 'admin/abstracts'

  get "home/index"
  
  root :to => 'home#index'

  match 'contact' => 'contact#new', :via => :get
  match 'contact' => 'contact#create', :via => :post
  match 'tourism' => 'pages#tourism', :via => :get
  match 'CfP' => 'pages#CfP', :via => :get
  match 'accomodation' => 'pages#accomodation', :via => :get
  match 'hospedaje' => 'pages#accomodation', :via => :get
  match 'transportation' => 'pages#transportation', :via => :get
  match 'press' => 'pages#press', :via => :get
  #ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
