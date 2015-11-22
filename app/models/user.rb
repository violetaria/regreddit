class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#  has_secure_password

  has_many :comments
  has_many :posts
  has_many :votes, through: :posts

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

end
