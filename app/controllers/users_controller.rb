class UsersController < ApplicationController
  
  def show #変数指定する
    @user = User.find(params[:id])
    @books = @user.books  #アソシエーション済み
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path
  end 


  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:usesr).permit(:name,:profile_image)
  end 
  
end
