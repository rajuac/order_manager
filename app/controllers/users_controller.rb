# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @report_generated = params[:report_generated]
  end

  def download_csv
    @user = User.find(params[:id])
    @file_master = FileMaster.find_or_create_by(user_id: params[:id], file_type: 'order_details')

    if @file_master.present? && @file_master.file_path.present? && File.exist?(@file_master.file_path)

      send_file @file_master.file_path, filename: "#{@user.username}_details.csv"
    elsif @file_master.present? && !@file_master.file_path.present?
      GenerateUserCsvJob.perform_later(params[:id], @file_master)
      report_generated = true
      redirect_to users_path(user_id: @user.id, report_generated: report_generated)

    end
  end

  def check_csv
    user = User.find(params[:id])
    @file_master = FileMaster.find_by(user_id: user.id, file_type: 'order_details')

    ready = @file_master.present? && @file_master.file_path.present? && File.exist?(@file_master.file_path)
    render json: { ready: ready }
  end
end
