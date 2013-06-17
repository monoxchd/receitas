class CategoriesController < ApplicationController
	def index
    @recipe_highlights = Recipe.have_image.order_by_rate.limit(6)
    @recipe_recents = Recipe.order_by_created_at.limit(4)
	end

	def show
		@category = Category.find(params[:id])
    @recipes = @category.recipes.order("created_at DESC")
	end
  def viewed
    @category = Category.find(params[:id])
    @recipes = @category.recipes.order("views DESC")
    render "show"
  end
  def voted
    render "show"
  end
end