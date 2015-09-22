class Admins::ReservationsController < Admins::ApplicationController

  def index
    @reservation_search = Reservation.search(params[:q])
    @reservations = @reservation_search.result.order("updated_at DESC")
  end

  def update
    @admin = current_admin
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to admins_reservations_path
    else 
      render 'edit'
    end
  end


  private
  
  def reservation_params
    params.require(:reservation).permit(:reservation_status_id)
  end

end
