class LocalsController < ApplicationController

	before_action :load_local, only: [:update, :show, :edit, :artist_filters]

	layout "local"	

	def new
		@artist = Artist.new(user_id: current_user.id)
	end

	def create
		@local = current_user.create_local(local_params)
	end

	def show
	end

	def edit
	end

	def update
		if @local.update_attributes(local_params)
			redirect_to local_path(@local)
		else
			render 'edit'
		end
	end

	def home
	end
		    
	def artist_filters
		@artists = @local.filter_for_artists(params[:you_are], params[:province])
	end


	private

	def load_local
		@local = current_user.local
	end

	def local_params
		params.require(:local).permit(:you_are,:shows, :type_of_professional, :type_of_exposition, :agreements)
	end

end
