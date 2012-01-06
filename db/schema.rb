# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120106071215) do

  create_table "applicants", :force => true do |t|
    t.string   "name"
    t.integer  "phone"
    t.string   "email"
    t.string   "school"
    t.string   "grate"
    t.string   "sex"
    t.integer  "tel"
    t.string   "pname"
    t.string   "address"
    t.string   "birth"
    t.string   "idcard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "video"
    t.string   "pic"
    t.datetime "created_at"
    t.integer  "cats_id"
    t.datetime "updated_at"
    t.string   "video_pic"
    t.string   "excerpt_image_file_name"
    t.string   "excerpt_image_content_type"
    t.integer  "excerpt_image_file_size"
    t.datetime "excerpt_image_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
