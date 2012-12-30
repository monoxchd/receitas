class RecipesController < ApplicationController
	def show
		@recipe = Recipe.find(params[:id])
    @recipe.views += 1
    @recipe.save
	end

	def search
		@recipes = Recipe.search(params[:query])
	end
end