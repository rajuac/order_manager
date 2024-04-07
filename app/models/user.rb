# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :email, :username, :phone

  validates_uniqueness_of :email, :username, :phone
end
