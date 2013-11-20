class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/} 

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

end
