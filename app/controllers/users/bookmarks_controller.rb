class Users::BookmarksController < Users::ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @bookmark = @book.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      redirect_to users_book_path(@book.id)
    else 
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @bookmark = @book.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to users_book_path(@bookmark.book_id)
  end

  private 

    def bookmark_params
      @user = current_user
      params.require(:bookmark).merge(user_id: @user.id)
    end


end 

