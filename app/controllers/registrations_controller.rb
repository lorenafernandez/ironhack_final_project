class RegistrationsController < Devise::RegistrationsController

	 def update
	 	@user = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  	  	@user.update_attribute(:name , params[:user][:name])
  	  	@user.update_attribute(:biography , params[:user][:biography])
  	  	@user.update_attribute(:contact_person, params[:user][:contact_person])
  	  	@user.update_attribute(:phone_number, params[:user][:phone_number])
  	  	@user.update_attribute(:address, params[:user][:address])
  	  	@user.update_attribute(:province, params[:user][:province])
  	  	@user.update_attribute(:town, params[:user][:town])
  	  	@user.update_attribute(:postal_code, params[:user][:postal_code])
  	  	@user.update_attribute(:web, params[:user][:web])
  	  	@user.update_attribute(:avatar, params[:user][:avatar])
  	  	@user.update_attribute(:twitter, params[:user][:twitter])
  	  	@user.update_attribute(:facebook, params[:user][:facebook])
  	  	@user.update_attribute(:instagram, params[:user][:instagram])
  	  	@user.update_attribute(:pinterest, params[:user][:pinterest])
		    @user.update_attribute(:google_plus, params[:user][:google_plus])
		    
        @identification = @user.id

  	  	redirect_to "/users/artist_final_registration/#{@identification}" if @user.role == 'Artist'
        redirect_to "/users/local_final_registration/#{@identification}" if @user.role == 'Local'
  	  end

	  protected

	  def after_sign_up_path_for(resource)
	    '/users/edit'
	  end

	  def update_resource(resource, params)
    	 resource.update_without_password(params)
  	  end


end
