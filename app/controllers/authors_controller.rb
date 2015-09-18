class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :destroy] 

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save 
      redirect_to authors_path
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params) 
      redirect_to authors_path
    else 
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

    def author_params
      params.require(:author).permit(:author_name)
    end

    def set_author
      @author = Author.find(params[:id])
    end

end
