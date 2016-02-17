class User < ActiveRecord::Base
	has_many :posts
	before_save {self.email = email.downcase }
	validates 	:username, presence: true, length: {minimum: 3, maximum: 50}, 
				uniqueness: { case_sensitive: false }
	EMAIL_VALID_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false},
	format: {with: EMAIL_VALID_REGEX} 
	has_secure_password
end