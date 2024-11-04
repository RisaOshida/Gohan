class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.goods.create(recipe_id: recipe.id)
    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    good = current_user.goods.find_by(recipe_id: recipe.id)
    good.destroy
    redirect_to recipe_path(recipe)
  end
end
