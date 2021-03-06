class PostsController < ApplicationController
http_basic_authenticate_with :name => "KingJohn", :password => "password", only: [:new]	
	def new
		@screenings = Screening.all
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		post.save
		screening = Screening.find(params[:post][:screenings])
		post.screenings.push(screening)
	end

	private

	def post_params
		params.require(:post).permit(:avatar)
	end
end
