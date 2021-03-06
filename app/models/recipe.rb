class Recipe < ActiveRecord::Base
	extend FriendlyId
  ajaxful_rateable stars: 5

  # attributes
  friendly_id :name, use: :slugged
  attr_accessible :description, :how_to, :ingredients, :name, :slug, :image, :category_id
  has_attached_file :image,
    styles: { medium: '380x260>', small: '190x130>', thumb: '96x66>' },
    default_url: '/assets/no_image_:style.gif'

  # associations
  belongs_to :category

  # validations
  validates_uniqueness_of :name, :slug
  validates_presence_of :category_id, :description, :how_to, :ingredients, :name, :slug

  # scopes
  scope :search, lambda { |query|
    where("name LIKE '%#{ query }%' OR description LIKE '%#{ query }%'")
  }
end