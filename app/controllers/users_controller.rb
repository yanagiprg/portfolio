class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # @user = User.find(current_user.id)
    @user = User.find_by(id: params[:id])
  end

end
