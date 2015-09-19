class Users::BooksController < ApplicationController
  before_action :set_book,  only: [:show, :edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @stocks = @book.stocks
    @reviews = @book.reviews.where(params[:id])
    @bookmarks = @book.bookmarks.where(params[:id])
    @user_bookmark = @bookmarks.find_by(user_id: current_user.id)
  end

  def new
    @book = Book.new
  end

  def create 
    @book = Book.new(book_params)
    if @book.save 
      redirect_to books_path
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params) 
      redirect_to books_path
    else 
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
