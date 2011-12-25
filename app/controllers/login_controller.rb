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
      flash[:notice] = "The username or password is not correct."
      redirect_to new_login_path
    end
  end
  
  def quit
    reset_session
    redirect_to new_login_path
  end
end
