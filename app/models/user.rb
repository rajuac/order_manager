
class User < ApplicationRecord
  validates_presence_of :email, :username, :phone

  validates_uniqueness_of :email, :username, :phone

  has_many :user_product_details
  has_many :products, through: :user_product_details
end
