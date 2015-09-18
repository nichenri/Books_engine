class BookmarksController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @bookmark = @book.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      redirect_to book_path(@book.id)
    else 
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @bookmark = @book.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to book_path(@bookmark.book_id)
  end

  private 

    def bookmark_params
      params.require(:bookmark).merge(user_id: current_user.id)
    end


end 

