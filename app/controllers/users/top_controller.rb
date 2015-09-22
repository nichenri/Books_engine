class Users::TopController < Users::ApplicationController
  def index
    @user = current_user
    @book_search = Book.search(params[:q])
    @books = @book_search.result
    @bookmarks = Bookmark.where(user_id: @user.id)
    @user_reservations = Reservation.where(user_id: @user.id).order("updated_at DESC")
  end
end
