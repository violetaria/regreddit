class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :posts

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

end
