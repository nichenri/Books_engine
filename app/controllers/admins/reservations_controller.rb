class Admins::ReservationsController < ApplicationController

  def update
    @admin = current_admin
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:reservation_status_id))
      redirect_to admins_top_index_path(@admin.id)
    else 
      render 'edit'
    end
  end

end
