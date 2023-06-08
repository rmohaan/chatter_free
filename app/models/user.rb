class User < ApplicationRecord
  validates :username, 
          presence: true, 
          length: {minimum: 3, maximum: 10 },
          uniqueness: { case_sensitive: true }
  has_secure_password
  has_many :messages
end
