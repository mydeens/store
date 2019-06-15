class UsersController < ApplicationController
  before_action :authenticate_user!, :check_if_user_is_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_back(fallback_location: root_path, alert: "Access denied.")
    end
  end

end
