class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  attr_accessible :body, :recipe_id
end
