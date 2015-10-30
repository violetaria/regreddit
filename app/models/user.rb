class User < ActiveRecord::Base
  validates_presence_of :email, :password, :username
  validates_uniqueness_of :email, :username
  validates_length_of :password, minimum: 8

  has_many :posts
end
