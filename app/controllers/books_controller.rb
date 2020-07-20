class BooksController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_book, only: [:edit, :update]

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to books_path, notice: 'You have creatad book successfully.'
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def show
		@book = Book.new
		@book_show = Book.find(params[:id])
		@user = @book_show.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: "You have updated book successfully."
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def correct_book
		book = Book.find(params[:id])
		if current_user.id != book.user_id
			redirect_to books_path
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end

end
