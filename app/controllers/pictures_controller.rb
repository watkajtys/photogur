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
	end

	def create
		@picture = Picture.new
		@picture.title = params[:title]
		@picture.artist = params[:artist]
		@picture.url = params[:url]
		success = @picture.save
		if success
			redirect_to '/pictures'
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		success = @picture.update_attributes(:title => params[:title], :artist => params[:artist], :url => params[:url])
		if success
			redirect_to '/pictures/'
		end
	end

	# def load_pictures
	# 	@pictures = [
	# 		{
	# 			:title => "The old church on the coast of the white sea",
	# 			:artist => "Sergey Ershov",
	# 			:url => 'http://monicao.s3.amazonaws.com/bitmaker/house.jpg'
	# 		},
	# 		{
	# 			:title => "Sea Power",
	# 			:artist => "Stephen Scullion",
	# 			:url => 'http://monicao.s3.amazonaws.com/bitmaker/wave.jpg'
	# 		},
	# 		{
	# 			:title => "Poppies",
	# 			:artist => "John Wilhelm",
	# 			:url => 'http://monicao.s3.amazonaws.com/bitmaker/girl.jpg'

	# 		}
	# 	]
	# end
end