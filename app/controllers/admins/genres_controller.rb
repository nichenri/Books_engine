class Admins::GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy] 

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @admin = current_admin
    @genre = Genre.new(genre_params)
    if @genre.save 
      redirect_to admins_genres_path(@admin.id)
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    @admin = current_admin
    if @genre.update(genre_params) 
      redirect_to admins_genres_path(@admin.id)
    else 
      render 'edit'
    end
  end

  def destroy
    @admin = current_admin
    @genre.destroy
    redirect_to admins_genres_path(@admin.id)
  end

  private

    def genre_params
      params.require(:genre).permit(:genre_name)
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end

end
