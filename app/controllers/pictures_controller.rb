class PicturesController < ApplicationController
	# before_filter :load_pictures

	def index
		@pictures = Picture.all
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
			flash.now[:error] = "Could not save the picture."
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
end