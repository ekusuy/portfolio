class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
    @contents = Content.where(user_id: @user.id) if @user
  end

  def index; end
end
