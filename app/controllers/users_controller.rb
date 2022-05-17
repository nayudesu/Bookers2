class UsersController < ApplicationController
  def show #変数指定する
    @user = User.find(params[:id])

  end

  def edit
  end
end
