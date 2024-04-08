
class Product < ApplicationRecord
  validates_presence_of :code, :name, :category
  validates_uniqueness_of :code, :name, :category
  has_many :user_product_details
  has_many :users, through: :user_product_details
end
