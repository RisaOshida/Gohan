class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe.id)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
