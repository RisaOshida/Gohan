class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(recipe.id)
  end

  def index
    @recipes = Recipe.all
   # if # params[プロパティ名]が存在する場合
      # 検索フォームで入力した商品名をもとにデータを取得
    #else
      # 今まで通り、一覧表示用のデータを取得
  #  end
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
      category_ids: []
    )
  end
end
