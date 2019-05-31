class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :delete]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def delete
    @user.destroy
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit

  end

  private

    def user_params
      params.require(:user).permit(:name, :phone_number)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
