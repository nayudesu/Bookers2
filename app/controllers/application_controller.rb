class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about] #権限設定
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
       user_path(resource)
  end
  
  def after_sign_in_path_for(resource) 
      user_path(resource)
  end
  
  def after_sign_out_path_for(resource) #サインイン後の遷移先はUsers 
    root_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) #ユーザー登録(sign_up)の際にユーザー名(name)のデータ操作を許可
  end
end
