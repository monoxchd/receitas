class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe.views += 1
    @recipe.save
  end

  def rate
    @recipe = Recipe.find(params[:id])
    @recipe.rate(params[:stars], current_user)
    redirect_to(root_path)
  end

  def search
    @recipes = Recipe.search(params[:query])
  end
end