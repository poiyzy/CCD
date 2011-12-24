class AdminController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def created
#    @post = Post.new do |p|
#      p.title = params[:title]
#      p.content = params[:content]
#      p.pic = params[:pic]
#      p.video = params[:video]
#      p.cats_id = params[:cats_id]
#    end
    @post = Post.new(params[:post])

    @post.save
    
    redirect_to admin_index_path
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
    @applicants = Applicant.all
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
end
