class User < ActiveRecord::Base
    validates_presence_of :username, :password_digest
    has_secure_password
    has_many :games
end
