class User < ActiveRecord::Base
    has_many :games
    has_secure_password
    validates_presence_of :username, :password_digest
    validates :username, presence: true, uniqueness: :true
    validates :password_digest, presence: true
end
