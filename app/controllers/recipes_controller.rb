class RecipesController < ApplicationController
	def show
		@categories = Category.all
		@recipe = Recipe.find(params[:id])
	end

	def search
		@recipes = Recipe.search(params[:query])
	end
end