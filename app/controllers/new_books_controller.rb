class NewBooksController < ApplicationController


  def index
    @applications = Application.all
  end

  def new
    @new_book = NewBook.new
  end

  def create
    @new_book = NewBook.new(new_book_params)
    @new_book.applications.build(user_id: current_user.id)
    @new_book.save
    redirect_to books_path
  end





  private 
    def new_book_params
      params.require(:new_book).permit(:title, :author, :publisher, :genre_id)
    end
end
