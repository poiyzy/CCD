class PostsController < ApplicationController
  def index
    @postnews = Post.find(:all, :conditions => { :cats_id => 1 })
    @postpics = Post.find(:all, :conditions => { :cats_id => 2 })
    @postvideos = Post.find(:all, :conditions => { :cats_id => 3 })
  end
  
  def show
    @post = Post.find(params[:id])
    cat_name
  end
  
  def cats
    @posts = Post.find(:all, :conditions => { :cats_id => params[:id]})
    cat_name
  end
  
  def cat_name
    if params[:id] = "1"
      @cat = "大赛新闻"
    elsif params[:id] = "2"
      @cat = "选手风采"
    elsif params[:id] = "3"
      @cat = "大赛视频"
    end
  end
  
end
