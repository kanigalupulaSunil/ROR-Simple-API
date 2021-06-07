class PostsController < ApplicationController

    before_action :set_post, only: [:show,:edit,:destroy]
   
    def home
    end

    def about
    end
    
    def show
    #   @post = Post.find(params[:id])
    end

    def index
      @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def edit
        # @post = Post.find(params[:id])
    end

    def create
    #   render plain: params[:post]

        @post = Post.new(post_params)
        # render plain:@post.inspect
        if @post.save
            flash[:notice] = "Post was created successfully."
        # redirect_to post_path(@post)
            redirect_to @posts_path
        else
            render 'new'
        end
    end


    def update
        # @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post was updated successfully."
            redirect_to @post
        else
            render 'edit'
        end
    end 


    def destroy
        # @post = Post.find(params[:id])
        @post.destroy
        redirect_to @posts_path
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title,:description)
    end
end
