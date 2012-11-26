require 'spec_helper'

describe 'recipes/show.html.erb' do
  it 'display a selected recipe on the menu' do
    @category = FactoryGirl.create(:category)
    @recipe = FactoryGirl.create(:recipe, category: @category)
    pending
    render

    rendered.should include(@recipe.name)
  end
end