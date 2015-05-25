class WorksController < ApplicationController

	before_action :load_artist, only: [:new, :create]

	def index
		render layout: "artist"
	end

	def new
		@work = @artist.works.new
		render layout: "artist"
	end

	def create
		work = @artist.works.new(work_params)
		if work.save
  	 	flash[:notice] = "Work created successfully"
  	 	render layout: "artist"
  	 else
  	 	flash.now[:alert] = "Fatal!!!!"
  	 	render 'new'
  	 end
	end


	private

	def load_artist
		@artist = Artist.find (params[:artist_id])
	end

	def work_params
		params.require(:work).permit(:title, :size, :price, :avatar)
	end

end
