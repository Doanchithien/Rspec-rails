class CategoriesController < ApplicationController
    before_filter :set_category, :only => [:show, :edit, :update, :destroy]

    def index 
        @categories = Category.all
    end

    def new 
        @category = Category.new
    end

    def show 
    end

    def create 
        @category = Category.new(params[:category])
        if @category.save 
            flash[:notice] = "Category was created!"
            redirect_to categories_path
        else
            render :action => "new"
        end
    end

    def edit 
    end

    def update 
        if @category.update_attributes(params[:category])
            flash[:notice] = "Category was updated!"
            redirect_to @category
        else
            render :action => "edit"
        end
    end
    
    def destroy
        if @category.destroy
            flash[:notice] = "Category was deleted!"
            redirect_to categories_path
        end
    end

    private 
     def set_category
        @category = Category.find(params[:id])
     end
end
