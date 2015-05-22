class WorksController < ApplicationController

	def new
		@artist = Artist.find_by(user_id: params[:artist_id])
		@work = @artist.works.new
		render layout: "artist"
	end

	def create
		artist = Artist.new(user_id: current_user.id)
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
