Rails.application.routes.draw do
  #get '/' => 'site#home', as: :home
  root to: 'site#home', as: :home

  get '/que_es_tuarte' => 'site#que_es_tuarte', as: :que_es_tuarte
  get '/sign_up' => 'site#sign_up', as: :sign_up
  get '/sign_in' => 'site#sign_in', as: :sign_in

end
