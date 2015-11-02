class Post < ActiveRecord::Base
	belongs_to :user

	has_many :votes
	has_many :users, through: :votes

	has_many :comments, dependent: :destroy

end
