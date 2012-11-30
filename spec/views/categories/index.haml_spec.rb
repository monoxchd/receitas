require 'spec_helper'

describe 'categories/index.haml' do
  it 'display all categories' do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)

    render

    rendered.should include('sampler')
  end
end