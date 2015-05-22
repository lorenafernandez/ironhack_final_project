Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :artists
  resources :locals

  root to: 'site#home', as: :home

  get '/que_es_tuarte' => 'site#que_es_tuarte', as: :que_es_tuarte
  get '/sign_up' => 'site#sign_up', as: :sign_up

  get '/users/password/new' => 'devise/passwords#new', as: :password_update
  get '/users/sign_up' => 'devise/registrations#new', as: :sign_up_from

  get '/users/edit' => 'registrations#edit'

  get '/artists/home' => 'artists#home', as: :artist_home
  get '/locals/home' => 'locals#home', as: :local_home

end