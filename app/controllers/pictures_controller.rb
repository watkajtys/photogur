class PicturesController < ApplicationController
	before_filter :load_pictures

	def index
	end

	def show
		@picture = @pictures[params[:id].to_i]
	end

	def new
	end

	def load_pictures
		@pictures = [
			{
				:title => "The old church on the coast of the white sea",
				:artist => "Sergey Ershov",
				:url => 'http://monicao.s3.amazonaws.com/bitmaker/house.jpg'
			},
			{
				:title => "Sea Power",
				:artist => "Stephen Scullion",
				:url => 'http://monicao.s3.amazonaws.com/bitmaker/wave.jpg'
			},
			{
				:title => "Poppies",
				:artist => "John Wilhelm",
				:url => 'http://monicao.s3.amazonaws.com/bitmaker/girl.jpg'

			}
		]
	end
end