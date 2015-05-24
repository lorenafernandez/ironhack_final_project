class WorksController < ApplicationController

	def index
		render layout: "artist"
	end

	def new
		@artist = Artist.find (params[:artist_id])
		@work = @artist.works.new
		render layout: "artist"
	end

	def create
		artist = Artist.find (params[:artist_id])
		work = artist.works.new(work_params)
		if work.save
  	 	flash[:notice] = "Work created successfully"
  	 	redirect_to home_path
  	 else
  	 	flash.now[:alert] = "Fatal!!!!"
  	 	render 'new'
  	 end
	end


	private
	def work_params
		params.require(:work).permit(:title, :size, :price, :avatar)
	end

end
