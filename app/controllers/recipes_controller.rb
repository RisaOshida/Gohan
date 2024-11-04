class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    @categories = Category.all
    10.times do
      @recipe.ingredients.build
      @recipe.steps.build
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes = Recipe.all
    @categories = Category.all
    if params[:name].present?
      @recipes = @recipes.where(name: params[:name])
    end
    if params[:category_id].present?
      @recipes = @recipes.where(category_id: params[:category_id])
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @good = Good.new
    @ingredients = Ingredient.all
    @steps = Step.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
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


  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :image,
      :introduction,
      :energy,
      :protein,
      :fat,
      :sodium,
      :category_id,
      ingredients_attributes: [:name],
      steps_attributes: [:step, :order],
    )
  end
end
