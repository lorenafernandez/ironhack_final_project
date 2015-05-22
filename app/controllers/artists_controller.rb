class ArtistsController < ApplicationController

	before_action :load_artist, only: [:update, :show, :edit]
	
	def new
		@artist = Artist.new(user_id: current_user.id)
		render layout: "artist"
	end

	def create
		@artist = current_user.create_artist(artist_params)
		render layout: "artist"
	end

	def show
		render layout: "artist"
	end

	def edit
	end

	def update
		if @artist.update_attributes(artist_params)
			redirect_to artist_path(@artist)
		else
			render 'edit'
		end
	end

	def home
		render layout: "artist"
	end


	private

	def load_artist
		@artist = current_user.artist
	end


	def artist_params
		params.require(:artist).permit(:you_are, :type_of_professional, :type_of_locals, :agreements_with_locals, :type_of_expositions)
	end

end
