# encoding: utf-8
class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
  end
  
  def new
    @post = Post.new
  end
  
  def created
    @post = Post.new(params[:post])

    if @post.save
      redirect_to admin_index_path
    else
      render :action => :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    cat_name(params[:id])
  end
  
  def updating
    @post = Post.find(params[:id])

    @post.update_attributes(params[:post])
    
    redirect_to admin_index_path

  end
  
  def del
    @post = Post.find(params[:id])
    
    @post.delete
    
      redirect_to admin_index_path
  end
  
  def apply
    @applicants = Applicant.paginate(:page => params[:page], :per_page => 10)
  end
  
  protected
  def cat_name(some_id)
    if some_id.to_s == "1"
      @cat = "大赛新闻"
    elsif some_id.to_s == "2"
      @cat = "选手风采"
    elsif some_id.to_s == "3"
      @cat = "大赛视频"
    end
  end
  
  private
  def authenticate_user!
    if session[:user_id] == 1
      return
    else
      flash[:notice] = "您需要先登陆才能访问！"
      redirect_to new_login_path
    end
  end

end
