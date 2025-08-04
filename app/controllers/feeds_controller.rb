class FeedsController < ApplicationController
  before_action :set_user

  def index
    sleep_records = SleepRecord
                      .where(user: @user.followings)
                      .where("start_time >= ?", 1.week.ago)
                      .where.not(end_time: nil)
                      .order(duration: :desc)
    render json: sleep_records
  end

  private

  def set_user
    @user = User.find(params[:user_id] || 1)
  end
end
