# frozen_string_literal: true

class UserProductDetail < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
