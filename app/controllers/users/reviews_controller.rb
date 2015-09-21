class Users::ReviewsController < Users::ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to users_book_path(@book.id)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to users_book_path(@review.book_id)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to users_book_path(@review.book_id)
  end

  private 

    def review_params
      @user = current_user
      params.require(:review).permit(:content).merge(user_id: @user.id)
    end
end
