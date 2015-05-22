class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
     if current_user.role =='Artist' 
        artist = current_user.create_artist
        path = artist_home_path      
      else
        local = current_user.create_local
        path = local_home_path
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
