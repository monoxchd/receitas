require 'spec_helper'

describe 'categories/index.html.erb' do
  it 'display all categories' do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)

    render
    pending
    # rendered.should include(@category.name)
  end
end