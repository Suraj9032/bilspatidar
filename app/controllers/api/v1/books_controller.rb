class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]
  skip_before_action :authenticate_request

  def index
    
    # authorize Book
    # @books = @current_user.admin ? Book.all : @current_user.books
     @books = Userrole.all
     render json: @books
  end

  def show
    authorize @book
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    authorize @book

    if @book.save
      render json: @book
    else
      render error: { error: 'Unable to create Book.' }, status: :unprocessable_entity
    end
  end

  def update
    authorize @book
    if @book.update(book_params)
      render json: { message: 'Book successfully update.' }
    else
      render json: { error: 'Unable to update Book.' }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @book
    if @book.destroy
      render json: { message: 'Book successfully deleted.' }
    else
      render json: { error: 'Unable to delete Book.' }, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :likes, :user_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
