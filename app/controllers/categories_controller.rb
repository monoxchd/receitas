class CategoriesController < ApplicationController
	def index
    @recipes_most_recent = Recipe.order("created_at DESC").limit(3)
    @recipes_most_viewed = Recipe.order("views DESC").limit(3)
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