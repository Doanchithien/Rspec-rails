class PostsController < ApplicationController
    before_filter :set_post, :only => [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all 
    end

    def new 
        @post = Post.new 
    end

    def create  
        @post = Post.new(params[:post])
        if @post.save 
            flash[:notice] = "Post was created!"
            redirect_to  request.referrer 
        else
            render :action => "new"
        end
    end

    def edit 
    end

    def update 
        if @post.update_attributes(params[:post])
            flash[:notice] = "Post was updated!"
            redirect_to @post 
        else
            render :action => "edit"
        end
    end

    def destroy
        if @post.destroy
            flash[:notice] = "Post was destroy"
            redirect_to posts_path
        end
    end

    private 
     def set_post 
        @post = Post.find(params[:id])
     end
end
