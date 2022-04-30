class PostsController < ApplicationController

    rescue_from Exception do |e|
        render json: { error: e.message }, status: :internal_error
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
    end

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
        @post.update!(update_params)
        render json: @post, status: 200
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content, :published, :user_id)
    end

    def update_params
        params.require(:post).permit(:title, :content, :published)
    end

end