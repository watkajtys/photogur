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
			redirect_to '/pictures'
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.update_attributes params[:picture]
			redirect_to "/pictures/#{@picture.id}"
		end
	end
end