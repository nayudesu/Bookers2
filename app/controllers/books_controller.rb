class BooksController < ApplicationController
  
  
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
      @book = Book.new(book_params)
    if book.save
      redirect_to book_path(@book.id)
    else
      render new
    end
  end
  
  def index
    @books = Book.all
  end


  def destroy
    @book = Book.find (params[:id])
    @book.destroy
    redirect_to books_path
  end
end