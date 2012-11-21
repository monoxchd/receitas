module Admin::RecipesHelper

	def recipe_categories_collection
		Category.all.map do |category|
			[category.name, category.id]
		end
	end

end
