# frozen_string_literal: true

class Product < ApplicationRecord
  validates_presence_of :code, :name, :category
  validates_uniqueness_of :code, :name, :category
end
