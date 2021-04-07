class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.new
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name, :room_number, :password)
  end
end
