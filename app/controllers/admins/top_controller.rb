class Admins::TopController < Admins::ApplicationController
  def index
    @book_search = Book.search(params[:q])
    @books = @book_search.result
    @book_search.build_condition
    @reservation_search = Reservation.search(params[:q])
    @reservations = @reservation_search.result
    @reservation_search.build_condition
    @bookmarks = Bookmark.all
    @reservations = Reservation.all
    @stock = Stock.new
  end



end
