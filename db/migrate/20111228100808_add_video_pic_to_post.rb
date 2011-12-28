class AddVideoPicToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :video_pic, :string
  end

  def self.down
    remove :posts, :video_pic
  end
end
