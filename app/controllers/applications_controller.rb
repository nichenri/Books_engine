class ApplicationsController < ApplicationController

  def update
    @application = Application.find(params[:id])
    if @application.update(params.require(:application).permit(:application_status_id))
      redirect_to new_books_path
    else
      render 'edit'
    end
  end

end

