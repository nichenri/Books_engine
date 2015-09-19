class Admins::TopController < ApplicationController
  def index
    @search = Book.search(params[:q])
    @books = @search.result
    @bookmarks = Bookmark.all
    @reservations = Reservation.all
    @stock = Stock.new
  end



end
