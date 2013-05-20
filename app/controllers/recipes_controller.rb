class RecipesController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @comment = Comment.new
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
    @recipe.views += 1
    @recipe.save
  end

  def rate
    @recipe = Recipe.find(params[:id])
    @recipe.rate(params[:stars], current_user)
  end

  def search
    @recipes = Recipe.search(params[:query])
  end
end