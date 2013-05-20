class User < ActiveRecord::Base
  ajaxful_rater
  has_many :comments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :last_name, :login, :avatar
  # attr_accessible :title, :body
  has_attached_file :avatar, 
  	styles: { small: '190x130>', thumb: '96x66>'},
  	default_url: '/assets/no_avatar_:style.gif'
end
