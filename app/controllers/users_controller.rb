class UsersController < ApplicationController
  
  def show 
    @user = current_user
    @books = Book.find(params[:id])  #アソシエーション済み
    @book = Book.new
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path
  end 
  
  def index
    @users = User.all
    @user = current_user

  end 


  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:usesr).permit(:name,:profile_image)
  end 
  
end
