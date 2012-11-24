require 'spec_helper'

describe 'routing categories' do
  it 'routes to #index' do
    get('/categorias').should route_to('categories#index')
  end

  it 'routes to #show' do
    get('/categorias/peixes').should route_to('categories#show', id: 'peixes')
  end
end