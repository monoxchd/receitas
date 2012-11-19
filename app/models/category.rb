class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessible :name, :slug
  has_many :recipes
  validates_uniqueness_of :name
  validates_presence_of :name
end
