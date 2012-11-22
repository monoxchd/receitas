class RecipesController < ApplicationController
	respond_to :html

	def show
		@categories = Category.all
		@recipe = Recipe.find(params[:id])

		respond_with @recipe
	end

	def search
		@recipes = Recipe.search params[:search]
		@search = params[:search]

		respond_with @recipes
	end

end
