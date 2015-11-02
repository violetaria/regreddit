class Post < ActiveRecord::Base
	belongs_to :user

	has_many :votes
	has_many :users, though: :votes

	has_many :comments, dependent: :destroy

end
