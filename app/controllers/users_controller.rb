class UsersController < ApplicationController

	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
  	@users = User.all
  	@book = Book.new
  	@user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@book_show = @user.books
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.profile_image_id = current_user.id
  	if @user.update(user_params)
  	  redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def correct_user
    user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
