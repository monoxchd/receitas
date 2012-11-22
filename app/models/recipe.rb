class Recipe < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessible :description, :how_to, :ingredients, :name, :slug, :image, :category_id
  belongs_to :category
  validates_uniqueness_of :name, :slug
  validates_presence_of :description, :how_to, :ingredients, :name, :slug
  has_attached_file	:image, 
  									:styles => { :small => "190x130>", :thumb => "96x66>"},
  									:default_url => "/assets/no_image.gif"
  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
end
