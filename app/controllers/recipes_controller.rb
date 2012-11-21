class RecipesController < ApplicationController
respond_to :html

def show
	@categories = Category.all
	@recipe = Recipe.find(params[:id])

	respond_with @recipe
end

end
