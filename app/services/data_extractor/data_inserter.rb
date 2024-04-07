# frozen_string_literal: true

module DataExtractor
  class DataInserter < BaseService
    def self.call
      new.call
    end

    def call
      UserDataSaver.new.call
      ProductDataSaver.new.call
      OrderDetailSaver.new.call
    rescue StandardError => e
      Rails.logger.info "error occured because of #{e}"
    end
  end
end
