class GoodsController < ApplicationController
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    good = current_user.goods.new(recipe_id: recipe.id)
    good.save
    redirect_to recipe_path(recipe.id)
  end
  
  def destroy
    recipe = Recipe.find(params[:recipe_id])
    good = current_user.goods.find_by(recipe_id: recipe.id)
    good.destroy
    redirect_to recipe_path(params[:recipe_id])
  end
  
end
