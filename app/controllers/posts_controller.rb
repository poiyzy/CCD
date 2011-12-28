# encoding: utf-8
class PostsController < ApplicationController
  def index
    @postnews = Post.find(:all, :conditions => { :cats_id => 1 })
    @postpics = Post.find(:all, :conditions => { :cats_id => 2 })
    @postvideos = Post.find(:all, :conditions => { :cats_id => 3 })
  end
  
  def show
    @post = Post.find(params[:id])
    cat_name(@post.cats_id)
  end
  
  def cats
    @posts = Post.find(:all, :conditions => { :cats_id => params[:id]})
    cat_name(params[:id])   
  end
  
  private
  def cat_name(some_id)
    if some_id.to_s == "1"
      @cat = "大赛新闻"
    elsif some_id.to_s == "2"
      @cat = "选手风采"
    elsif some_id.to_s == "3"
      @cat = "大赛视频"
    end
  end
  
end
