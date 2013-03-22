class PicturesController < ApplicationController
	# before_filter :load_pictures

	def index
		@pictures = Picture.all
		if params[:free] == 'yes'
			@pictures = Picture.free.all
		else 
			@pictures = Picture.alphabetical.all
		end
	end

	def show
		@picture = Picture.find params[:id]
	end

	def new
		@picture = Picture.new
		@picture.title = "Enter Title"
	end

	def create
		@picture = Picture.new(params[:picture])
		if @picture.save
			redirect_to pictures_path
		else 
			flash[:error] = "Could not save the picture. Please try again."
			render :new
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.update_attributes params[:picture]
			redirect_to @picture
		else
			redirect_to pictures_path
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to pictures_path
	end
end