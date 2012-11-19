class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.text :ingredients
      t.text :how_to
      t.string :slug
      t.attachment :image
      t.references :category

      t.timestamps
    end
  end
end
