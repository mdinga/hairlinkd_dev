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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180406211155) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "password_digest"
    t.string "string"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.string "name"
    t.index ["city_id"], name: "index_areas_on_city_id"
  end

  create_table "areas_clients", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "area_id"
    t.integer "client_id"
    t.index ["area_id", "client_id"], name: "index_areas_clients_on_area_id_and_client_id"
  end

  create_table "areas_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "area_id"
    t.integer "stylist_id"
    t.index ["area_id", "stylist_id"], name: "index_areas_stylists_on_area_id_and_stylist_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city"
  end

  create_table "cities_clients", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.integer "client_id"
    t.index ["city_id", "client_id"], name: "index_cities_clients_on_city_id_and_client_id"
  end

  create_table "cities_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.integer "stylist_id"
    t.index ["city_id", "stylist_id"], name: "index_cities_stylists_on_city_id_and_stylist_id"
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", limit: 20
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fav_styles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "client_id"
    t.integer "style_id"
    t.index ["client_id", "style_id"], name: "index_fav_styles_on_client_id_and_style_id"
  end

  create_table "fav_stylists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "client_id"
    t.index ["stylist_id", "client_id"], name: "index_fav_stylists_on_stylist_id_and_client_id"
  end

  create_table "hairstyles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "hairstyle"
    t.string "style_category"
    t.text "style_description", limit: 255
  end

  create_table "hairstyles_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "hairstyle_id"
    t.index ["stylist_id", "hairstyle_id"], name: "index_hairstyles_stylists_on_stylist_id_and_hairstyle_id"
  end

  create_table "portfolios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.integer "stylist_id"
    t.integer "service_id"
    t.text "details"
    t.index ["stylist_id", "service_id"], name: "index_portfolios_on_stylist_id_and_service_id"
  end

  create_table "portfolios_services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "portfolio_id"
    t.integer "service_id"
    t.index ["portfolio_id", "service_id"], name: "index_portfolios_services_on_portfolio_id_and_service_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "product_name"
    t.string "category"
    t.string "sub_category"
    t.integer "stylist_id"
    t.integer "client_id"
    t.integer "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id", "client_id"], name: "index_products_on_stylist_id_and_client_id"
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "client_id"
    t.date "date_of_appointment", default: "2017-11-23"
    t.string "style_id"
    t.float "rating_1", limit: 24, default: 0.0
    t.float "rating_2", limit: 24, default: 0.0
    t.float "rating_3", limit: 24, default: 0.0
    t.float "rating_4", limit: 24, default: 0.0
    t.float "rating_5", limit: 24, default: 0.0
    t.float "total_rating", limit: 24, default: 0.0
    t.boolean "return"
    t.boolean "recommend"
    t.text "Comment"
    t.index ["stylist_id", "client_id", "style_id"], name: "index_ratings_on_stylist_id_and_client_id_and_style_id"
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "category"
    t.text "description", limit: 255
  end

  create_table "services_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "service_id"
    t.integer "stylist_id"
    t.index ["service_id", "stylist_id"], name: "index_services_stylists_on_service_id_and_stylist_id"
  end

  create_table "styles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "style_name"
    t.string "category"
    t.string "sub_category"
    t.text "details", limit: 255
    t.integer "stylist_id"
    t.integer "client_id"
    t.integer "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["stylist_id", "client_id"], name: "index_styles_on_stylist_id_and_client_id"
  end

  create_table "stylists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "avatar"
    t.string "username", limit: 20
    t.string "name"
    t.string "surname"
    t.string "password_digest"
    t.float "overall_rating", limit: 24, default: 0.0
    t.boolean "house_calls", default: false
    t.text "about_me"
    t.string "phone"
    t.string "email"
    t.string "facebook_link"
    t.string "instagram_link"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salon"
  end

end
