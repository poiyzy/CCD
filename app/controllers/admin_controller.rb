class AdminController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new    
  end
  
  def created
    @post = Post.new do |p|
      p.title = params[:title]
      p.content = params[:content]
      p.pic = params[:pic]
      p.video = params[:video]
      p.cats_id = params[:cats_id]
    end

    @post.save!
    
    redirect_to admin_index_path
  end
  
  def apply
    @applicants = Applicant.all
  end
end
