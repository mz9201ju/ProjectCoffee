class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    
    def index
        @recipe = Recipe.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        
        if @recipe.save
            redirect_to @recipe, notice: "Successfully"
        else
            render 'new'
        end
    end
    
    
    def edit
    end
    
    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        elsif
            render 'edit'
        end
    end
    
    
    def destroy
        @recipe.destroy
        redirect_to root_path, notice: "Successfully Deleted"
    end
    
    
    private
    
    def recipe_params
        params.permit(params[:id],:milk, :sugar, :coffee_blend, :strength)
        
    end
    
    
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
end
