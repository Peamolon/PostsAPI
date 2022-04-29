class User < ApplicationRecord
    has_many :posts
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :auth_token, presence: true, uniqueness: true
end
