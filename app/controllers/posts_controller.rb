class PostsController < ApplicationController
	def index
		@posts = Post.all

		render json: @posts, status: :ok

	end

	def create
		@post = Post.new(post_params)

		@post.save
		render json: @post, status: :created
	end

	def destroy
		@post = Post.where(id: params[:id]).first
		if @post.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end

	private

	def contact_params
		params.require(:post).permit(:title, :content)
	end

end