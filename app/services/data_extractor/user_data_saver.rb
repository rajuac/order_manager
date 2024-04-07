# frozen_string_literal: true

module DataExtractor
  class UserDataSaver < BaseService
    def call
      extract_data
    end

    private

    def extract_data
      file_path = Rails.root.join('public', 'users.csv')
      ::CSV.foreach(file_path, headers: true) do |row|
        user_params = {
          username: row['USERNAME'],
          email: row['EMAIL'],
          phone: row['PHONE']
        }
        User.create(user_params)
      end
    end
  end
end
