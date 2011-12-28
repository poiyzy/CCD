# encoding: utf-8
class LoginController < ApplicationController
  def new
  end
  
  def create
    @user = User.authentication(params[:login], params[:password])
    if @user
      session[:user_id] = @user.id
      session[:user_login] = @user.login
      flash[:notice] = "用户： #{@user.login}"
      redirect_to admin_index_path
    else
      flash[:notice] = "用户名或密码不正确。"
      redirect_to new_login_path
    end
  end
  
  def quit
    reset_session
    flash[:notice] = '您已退出。'
    redirect_to new_login_path
  end
end
