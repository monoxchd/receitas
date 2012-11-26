require 'spec_helper'

describe 'categories/index.html.erb' do
  it 'display all categories' do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)

    render

    rendered.should include('<div id="sampler">')
  end
end