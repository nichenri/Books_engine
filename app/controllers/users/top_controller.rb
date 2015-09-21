class Users::TopController < Users::ApplicationController
  def index
    @user = current_user
    @search = Book.search(params[:q])
    @books = @search.result
    @search.build_condition
    @bookmarks = Bookmark.where(user_id: @user.id)
    @reservations = Reservation.where(user_id: @user.id).order("updated_at DESC")
  end
end
