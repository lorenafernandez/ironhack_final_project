class ArtistsController < ApplicationController

	def new
		@user = User.find params[:id]
		@artist = @user.artists.new
	end

	def create
		@user = User.find params[:user_id].first
		@artist = @user.artists.create(artist_params)
		render layout: "artist"
	end

	def show
		@user = User.where("id=?", params[:id]).last
		#artist = Artist.where("user_id=?", @user.id).last
		#binding.pry
		#artist_is_a = artist.you_are
		#profesional_type = artist.type_of_professional
		#find_locals_for_artist(artist_is_a,profesional_type)
		render layout: "artist"
	end

	def artist_final_registration

	end

	def find_locals_for_artist(artist_is_a,profesional_type)
		binding.pry
	end

	private
	def artist_params
		params.permit(:you_are,:type_of_professional)
	end

end
