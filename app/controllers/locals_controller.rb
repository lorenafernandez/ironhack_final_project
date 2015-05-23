class LocalsController < ApplicationController

	before_action :load_local, only: [:update, :show, :edit]

	def new
		@artist = Artist.new(user_id: current_user.id)
		render layout: "local"
	end

	def create
		@local = current_user.create_local(local_params)
		render layout: "local"
	end

	def show
		render layout: "local"
	end

	def edit
		render layout: "last_register_local"
	end

	def update
		if @local.update_attributes(local_params)
			redirect_to local_path(@local)
		else
			render 'edit'
		end
	end

	def home
		render layout: "local"	
	end
		    
	

	private

	def load_local
		@local = current_user.local
	end

	def local_params
		params.require(:local).permit(:you_are,:shows, :type_of_professional, :type_of_exposition, :agreements)
	end

end
