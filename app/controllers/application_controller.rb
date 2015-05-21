class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
  	 mail = params[:user][:email]
  	 user = User.where("email=?",mail)
  	 id = user.first.id
  	 role = user.first.role
  	 redirect_to_role(role,id)
  end

  def redirect_to_role(role,id)
  	if role == 'Artist'
  		show_artist_path(id)
  	elsif role == 'Local'
  		show_local_path(id)
  	end
  			
  end

  private
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) << :role
  		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :biography,
                                                        :contact_person, :phone_number, 
                                                        :address, :web, :rrss, :avatar, :id )}
  	end


end
