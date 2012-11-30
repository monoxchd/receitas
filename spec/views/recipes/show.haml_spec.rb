# encoding: utf-8

require 'spec_helper'

describe 'recipes/show.haml' do
  it 'display a selected recipe on the menu' do
    @category = FactoryGirl.create(:category)
    @recipe = FactoryGirl.create(:recipe, category: @category, ingredients: "-10 Filés de frango\n-Suco de 1/2 limão\n-1 colher de sopa de tempero pronto\n-sal, pimenta e manteiga a gosto\n-1 maço de espinafre cozido e espremido\n-1 colher de sopa de cebola\n-1 dente de alho\n-1 colher de sopa rasa de farinha de trigo\n-700ml de leite\n-1 caixa de creme de leite\n-Queijo ralado para polvilhar", how_to: "-Tempere os filés com o suco de limão, tempero pronto, sal e pimenta a gosto.\n-Aqueça a manteiga na frigideira e frite os filés.\n-Acomode em um refrátario e regue com o molho de espinafre.\n-Para molho de espinafre,aqueça em uma panela 2 colhes de manteiga.\n-Coloque a farinha de trigo e misture.\n-Acrescente o leite aos poucos,sempre mexendo para não empolar.\n-Junte o sal,a pimenta opcinal, o alho e a cebola.\n-A seguir,coloque o espinafre, cozido e espremido.\n-Desligue e junte o creme de leite.")

    render

    rendered.should include(@recipe.name)
  end
end