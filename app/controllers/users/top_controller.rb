class Users::TopController < ApplicationController
  def index
    @user = current_user
    @search = Book.search(params[:q])
    @books = @search.result
    @bookmarks = Bookmark.where(user_id: @user.id)
    @reservations = Reservation.where(user_id: @user.id)
  end
end
