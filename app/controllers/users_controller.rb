class UsersController < ApplicationController
  def show
    @user = current_user
    @contents = Content.where(user_id: @user.id) if @user
  end
end
