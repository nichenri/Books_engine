class Users::ReservationsController < Users::ApplicationController
  before_action :set_book
  before_action :set_stock
  before_action :set_reservation, only: [:update, :destroy]


  def index
    @reservations = @stock.reservations.all
  end



  def create
    @reservation = @stock.reservations.new(user_id: current_user.id, reservation_status_id: 1)
    if @reservation.save
      redirect_to users_book_path(@book.id)
    else
      render 'new'
    end
  end

  def update
    if @reservation.update(params.require(:reservation).permit(:reservation_status_id))
      redirect_to book_stock_reservations_path(@book.id, @stock.id)
    else 
      render 'edit'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to users_book_path(@book.id)
  end


  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_stock
      @stock = @book.stocks.find(params[:stock_id])
    end

    def set_reservation
      @reservation = @stock.reservations.find(params[:id])
    end

end
