# frozen_string_literal: true

require 'csv'

class BaseService
  attr_reader :params

  def initialize(params = {})
    @params = params
  end
end
