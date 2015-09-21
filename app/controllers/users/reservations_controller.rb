class Users::ReservationsController < Users::ApplicationController

  def index
    @book = Book.find(params[:book_id])
    @stock = @book.stocks.find(params[:stock_id])
    @reservations = @stock.reservations.all
  end



  def create
    @book = Book.find(params[:book_id])
    @stock = @book.stocks.find(params[:stock_id])
    @reservation = @stock.reservations.new(user_id: current_user.id, reservation_status_id: 1)
    if @reservation.save
      redirect_to users_book_path(@book.id)
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:book_id])
    @stock = @book.stocks.find(params[:stock_id])
    @reservation = @stock.reservations.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:reservation_status_id))
      redirect_to book_stock_reservations_path(@book.id, @stock.id)
    else 
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @stock = @book.stocks.find(params[:stock_id])
    @reservation = @stock.reservations.find(params[:id])
    @reservation.destroy
    redirect_to users_book_path(@book.id)
  end


end
