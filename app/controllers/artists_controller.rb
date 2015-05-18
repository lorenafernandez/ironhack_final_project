class ArtistsController < ApplicationController

	def new
		@user = User.find params[:user_id]
		@artist = @user.artists.new
	end

	def show
	end
end
