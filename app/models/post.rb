class Post < ActiveRecord::Base
  has_attached_file :excerpt_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  require "open-uri"
  
  default_scope :order => 'created_at DESC'
  
  validates :content, :presence => true
  validates :title, :presence => true
  
  def video_share
    @videoshare
  end
  
  def video_share=(videourl)
    return unless videourl
    @videoshare = videourl
    youku_cover(videourl)
  end
  
  private
  def youku_cover(videourl)
    %r|http:\/\/v\.youku\.com\/v_show\/id_([\w\d+_-]*)\.html| =~ videourl
    unless $1
      self.video_pic
      self.video
    else
      url = "http://v.youku.com/player/getPlayList/VideoIDS/" + $1
      videoplaylist = open(url).read
      videohash = JSON.parse(videoplaylist)
      self.video_pic = videohash["data"][0]["logo"]
      self.video = $1
    end
  end
  
end
