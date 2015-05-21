Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :artists
  resources :locals

  root to: 'site#home', as: :home

  get '/que_es_tuarte' => 'site#que_es_tuarte', as: :que_es_tuarte
  get '/sign_up' => 'site#sign_up', as: :sign_up
  #get '/sign_in' => 'site#sign_in', as: :sign_in

  get '/users/password/new' => 'devise/passwords#new', as: :password_update
  get '/users/sign_up' => 'devise/registrations#new', as: :sign_up_from


  get '/users/edit' => 'registrations#edit'

  patch '/artists/register' => 'artists#show', as: :artists_register
  put '/artists/register' => 'artists#show'

  patch '/locals/register' => 'locals#show', as: :locals_register
  put '/locals/register' => 'locals#show'

  get '/artists/welcome/:id' => 'artists#show' , as: :show_artist
  get '/locals/welcome/:id' => 'locals#show' , as: :show_local

end