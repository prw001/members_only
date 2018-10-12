class User < ApplicationRecord
	attr_accessor :remember_token

	before_save :downcase_email
	before_validation :remember, on: :create
	has_secure_password
	validates :password, presence: true, length: { minimum: 6}, confirmation: true

	def self.digest(token)
		Digest::SHA1.hexdigest token
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	private

		def downcase_email
			self.email.downcase!
		end

end
