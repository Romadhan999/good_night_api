class SleepRecordsController < ApplicationController
  before_action :set_user

  # POST clock in
  def create
    record = @user.sleep_records.create!(start_time: Time.current)
    render json: @user.sleep_records.order(created_at: :asc), status: :created
  end

  # PATCH clock out
  def update
    record = @user.sleep_records.find(params[:id])
    record.update!(end_time: Time.current)
    render json: record, status: :ok
  end

  # GET sleep records
  def index
    render json: @user.sleep_records.order(created_at: :asc)
  end

  private

  def set_user
    @user = User.find(params[:user_id] || 1)
  end
end
