class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :video
      t.string :pic
      t.datetime :created_at
      t.integer :cats_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
