class LocalsController < ApplicationController

	def new
		@user = User.find params[:id]
		@local = @user.locals.new
	end

	def create
		@user = User.find params[:user_id]
		@local = @user.locals.create(local_params)
	end

	def show
	end

	def local_final_registration

	end

	private
	def local_params
		params.permit(:you_are,:shows, :type_of_professional, :type_of_exposition, :agreements)
	end

end
