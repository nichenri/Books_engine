class Admins::StocksController < Admins::ApplicationController
  before_action :set_stock, only: [:edit, :update, :destroy] 

  def create
    @book = Book.find(params[:book_id])
    @stock = @book.stocks.new
    if @stock.save 
      redirect_to admins_top_index_path
    else 
      render 'new'
    end
  end

  def destroy
    @stock.destroy
    redirect_to admins_top_index_path
  end

  private

    def stock_params
      params.require(:stock).permit(:book_id)
    end

    def set_stock
      @stock = Stock.find(params[:id])
    end

end
