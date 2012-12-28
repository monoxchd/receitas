class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
    @recipes = @category.recipes.order("created_at ASC")
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