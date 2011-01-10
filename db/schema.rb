# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101021085543) do

  create_table "archiwes", :force => true do |t|
    t.integer  "magazine_id"
    t.integer  "status"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "covers", :force => true do |t|
    t.integer  "magazine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "egalleries", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "egalleryps", :force => true do |t|
    t.integer  "egallery_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position"
  end

  create_table "eventdays", :force => true do |t|
    t.integer  "event_id"
    t.datetime "pday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "place_id"
    t.integer  "category_id"
    t.integer  "magazine_id"
    t.time     "start_time"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price"
    t.text     "more"
    t.boolean  "e",           :default => false
  end

  create_table "eversions", :force => true do |t|
    t.integer  "magazine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "iadres", :force => true do |t|
    t.string   "title"
    t.string   "adres"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "magazines", :force => true do |t|
    t.datetime "start_date"
    t.integer  "status",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "miejsce"
    t.string   "miejsca"
  end

  create_table "places", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "adres"
    t.string   "telephone"
    t.string   "email"
    t.string   "web"
    t.text     "more"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prints", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_file_size"
    t.string   "image_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "magazine_id"
  end

  create_table "soons", :force => true do |t|
    t.integer  "magazine_id"
    t.integer  "position"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsorizations", :force => true do |t|
    t.integer  "topone_id"
    t.integer  "event_id"
    t.integer  "sponsor_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", :force => true do |t|
    t.integer  "topone_id"
    t.string   "event_id"
    t.string   "title"
    t.string   "adres"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "topones", :force => true do |t|
    t.integer  "magazine_id"
    t.integer  "category_id"
    t.integer  "place_id"
    t.text     "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.text     "more"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "videos", :force => true do |t|
    t.string   "original_file_name"
    t.string   "original_file_size"
    t.string   "original_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "magazine_id"
  end

  create_table "zgloszenias", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "ticket"
    t.string   "ticket_price"
    t.string   "adres"
    t.string   "street"
    t.string   "place"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "web"
    t.string   "person_name"
    t.string   "person_surname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
