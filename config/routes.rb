Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :artists do
      member do
        get 'home'
        get 'local_filters'
        post 'local_filters'     
      end
      resources :works
  end

  resources :locals do
    member do
      get 'home'
      post 'artist_filters'
      get 'artist_filters'
    end
  end

  root to: 'site#home', as: :home

  get '/que_es_tuarte' => 'site#que_es_tuarte', as: :que_es_tuarte
  get '/sign_up' => 'site#sign_up', as: :sign_up

end