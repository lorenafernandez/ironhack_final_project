Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :artists do
      get 'home', on: :member
  end

  resources :locals do
    get 'home', on: :member
  end

  root to: 'site#home', as: :home

  get '/que_es_tuarte' => 'site#que_es_tuarte', as: :que_es_tuarte
  get '/sign_up' => 'site#sign_up', as: :sign_up

end