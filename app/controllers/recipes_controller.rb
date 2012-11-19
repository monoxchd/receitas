class RecipesController < ApplicationController
respond_to :html


def index
	@recipes = Recipe.find(params[:post_id])


	respond_with @recipes
end

def show
	@recipe = Recipe.find(params[:id])

	respond_with @recipe
end

end
