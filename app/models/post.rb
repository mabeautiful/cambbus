class Post < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: { minimum: 3, maximum: 100}
	validates :content, presence: true, length: {minimum: 10}
	validates :user_id, presence: true
end
