class Post < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :post_users, dependent: :destroy
  has_many :users, through: :post_users
  belongs_to :user
end
