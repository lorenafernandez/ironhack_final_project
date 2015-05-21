class RegistrationsController < Devise::RegistrationsController

	 def update
	 	@user = current_user

    if @user.update_attributes(user_params)
      path = if @user.role == 'Artist'
        artist = @user.artist
        artist.present? ? edit_artist_path(artist) : new_artist_path
      else
        local = @user.local
        local.present? ? edit_local_path(local) : new_local_path
      end  
      redirect_to path

      else
        puts @user.errors
  	  end
    end

    private

	  def after_sign_up_path_for(resource)
	    '/users/edit'
	  end

	  def update_resource(resource, params)
    	 resource.update_without_password(params)
  	end

    def user_params
      params.require(:user).permit(:name, :biography, :contact_person, :phone_number, 
        :address,:province, :town, :postal_code, :web, :avatar, {rrss: []}, :google_plus)
    end


end
