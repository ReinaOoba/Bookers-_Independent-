class UsersController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated your registration information successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user), notice: "You can't do this action!"
    end
  end

end
