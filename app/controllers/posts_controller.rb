class PostsController < ApplicationController
    def index
        @posts = Post.where(published: true)
        render json: @posts, status: 200
    end

    def show 
        @post = Post.find(params[:id])
        render json: @post, status: 200
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            render json: @post, status: :created
        else
            render json: { errors: @post.errors }, status: 422
        end
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
        render json: @post, status: 200
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content, :published, :user_id)
    end

end