class Receiver < ApplicationRecord
	has_many :pages
  	serialize :verification_fields_needed
	before_save { email.downcase! }
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX },
	                   uniqueness: { case_sensitive: false }
   	has_secure_password
   	validates :password, presence: true, length: { minimum: 6 }, on: :create
end
