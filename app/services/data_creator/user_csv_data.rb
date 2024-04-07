# frozen_string_literal: true

module DataCreator
  class UserCsvData < BaseService
    def generate
      make_csv_data
    end

    private

    def make_csv_data
      user = params[:user]
      order_details = UserProductDetail.where(user_id: user.id)
      headers = %w[USERNAME USER_EMAIL PRODUCT_CODE PRODUCT_NAME PRODUCT_CATEGORY ORDER_DATE]
      csv_data = []

      order_details.each do |detail|
        data = [
          user.username,
          user.email,
          detail.product.code,
          detail.product.name,
          detail.product.category,
          detail.order_date
        ]
        csv_data << data
      end

      CSV.generate(headers: headers, write_headers: true) do |csv|
        csv_data.each do |data_row|
          csv << data_row
        end
      end
    end
  end
end
