class Admins::PublishersController < Admins::ApplicationController
  before_action :set_publisher, only: [:edit, :update, :destroy] 
  def index
    @publishers = Publisher.all
    @publisher = Publisher.new
  end

  def create
    @admin = current_admin
    @publisher = Publisher.new(publisher_params)
    if @publisher.save 
      redirect_to admins_publishers_path(@admin.id)
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    @admin = current_admin
    if @publisher.update(publisher_params) 
      redirect_to admins_publishers_path(@admin.id)
    else 
      render 'edit'
    end
  end

  def destroy
    @admin = current_admin
    @publisher.destroy
    redirect_to admins_publishers_path(@admin.id)
  end

  private

    def publisher_params
      params.require(:publisher).permit(:publisher_name)
    end

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

end
