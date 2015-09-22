class Admins::TopController < Admins::ApplicationController
  def index
    @book_search = Book.search(params[:q])
    @books = @book_search.result
    @reservations = Reservation.all
    @stock = Stock.new
  end



end
