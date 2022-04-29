class PostsController < ApplicationController
    def index
        @posts = Post.where(published: true)
        render json: @posts, status: 200
    end

    def show 
        @post = Post.find(params[:id])
        render json: @post, status: 200
    end

end