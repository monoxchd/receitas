require 'spec_helper'

describe 'routing recipes' do
  it 'routes to #show' do
    get('/categorias/peixes/salmao-grelhado').should route_to('recipes#show',
      category_id: 'peixes', id: 'salmao-grelhado')
  end

  it 'routes do #search' do
    get('/busca/peixes').should route_to('recipes#search', query: 'peixes')
  end
end