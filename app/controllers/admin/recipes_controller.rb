class Admin::RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @recipe = Recipe.find(params[:id]) 
  end
  
  def update
    recipe = Recipe.find(params[:id]) 
    recipe.update(recipe_params)
    redirect_to recipe_path(recipe.id)  
  end
  
  def destroy
    recipe = Recipe.find(params[:id]) 
    recipe.destroy
    redirect_to root_path
  end
  
  
end
