class FollowsController < ApplicationController
  before_action :set_user

  def create
    followed_user = User.find(params[:id])
    @user.followings << followed_user unless @user.followings.include?(followed_user)
  end

  def destroy
    followed_user = User.find(params[:id])
    @user.followings.destroy(followed_user)
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id] || 1)
  end
end
