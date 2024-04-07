# frozen_string_literal: true

module DataExtractor
  class ProductDataSaver < BaseService
    def call
      extract_data
    end

    private

    def extract_data
      file_path = Rails.root.join('public', 'products.csv')
      ::CSV.foreach(file_path, headers: true) do |row|
        product_params = {
          code: row['CODE'],
          name: row['NAME'],
          category: row['CATEGORY']
        }
        Product.create(product_params)
      end
    end
  end
end
