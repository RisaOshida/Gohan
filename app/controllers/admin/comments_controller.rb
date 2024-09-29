class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end
  
end
