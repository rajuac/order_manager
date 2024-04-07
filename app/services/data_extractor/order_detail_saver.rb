# frozen_string_literal: true

module DataExtractor
  class OrderDetailSaver < BaseService
    def call
      extract_data
    end

    private

    def extract_data
      file_path = Rails.root.join('public', 'order_details.csv')
      ::CSV.foreach(file_path, headers: true) do |row|
        product = Product.find_by(code: row['PRODUCT_CODE'])
        user = User.find_by(email: row['USER_EMAIL'])
        order_date = row['ORDER_DATE']
        next unless product.present? && user.present?

        order_detail_param = { product_id: product.id, user_id: user.id, order_date: order_date }
        UserProductDetail.create(order_detail_param)
      end
    end
  end
end
