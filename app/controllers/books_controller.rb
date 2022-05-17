class BooksController < ApplicationController
  
  def show
  end

  def index
  end
  
  def create
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def destroy
  end
end
