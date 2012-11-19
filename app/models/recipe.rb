class Recipe < ActiveRecord::Base
  attr_accessible :description, :how_to, :ingredients, :name, :slug, :images
  belongs_to :category
  validates_uniqueness_of :name, :slug
  validates_presence_of :description, :how_to, :ingredients, :name, :slug
  has_attached_file :image, :styles => { :thumb => "96x66>"}
end
