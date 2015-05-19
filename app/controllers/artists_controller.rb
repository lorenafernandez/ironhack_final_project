class ArtistsController < ApplicationController

	def new
		@user = User.find params[:id]
		@artist = @user.artists.new
	end

	def create
		@user = User.find params[:user_id]
		@artist = @user.artists.create(artist_params)
	end

	def show
	end

	def artist_final_registration

	end

	private
	def artist_params
		params.permit(:you_are,:type_of_professional)
	end

end
