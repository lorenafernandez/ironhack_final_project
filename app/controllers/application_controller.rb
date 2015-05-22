class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
     if current_user.role =='Artist' 
        artist = Artist.find_by :user_id => params[:user_id]
        path = home_artist_path(artist)    
      else
        local = Local.find_by :user_id => params[:user_id]
        path = home_local_path(local)
      end
      path
  end


  private
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) << :role
  		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :biography,
                                                        :contact_person, :phone_number, 
                                                        :address, :web, :rrss, :avatar, :id )}
  	end


end
