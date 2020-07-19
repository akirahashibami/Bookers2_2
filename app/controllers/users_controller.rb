class UsersController < ApplicationController
  def index
  	@users = User.all
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@book_show = @user.books
  	@book = Book.new
  end
end
