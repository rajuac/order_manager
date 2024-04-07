# frozen_string_literal: true

class GenerateUserCsvJob < ApplicationJob
  queue_as :default

  def perform(user_id, file_master)
    user = User.find(user_id)
    csv_content = DataCreator::UserCsvData.new(user: user).generate
    file_path = "#{Rails.root}/tmp/#{user.username}_details.csv"
    File.write(file_path, csv_content)
    file_master.update(file_path: file_path)
  end
end
