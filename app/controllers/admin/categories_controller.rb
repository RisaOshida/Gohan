class Admin::CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to category_path(category.id)
  end

  def index
    @categories = Category.all
  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to category_path(category.id)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to category_path(category.id)
  end

private

  def category_params
    params.require(:category).permit(:category)
  end

 
end
