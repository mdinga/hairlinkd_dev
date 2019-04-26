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

ActiveRecord::Schema.define(version: 20190408094848) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "password_digest"
    t.string "string"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", default: ""
  end

  create_table "admins_def_admins", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "admin_id"
    t.bigint "def_admin_id"
    t.index ["admin_id", "def_admin_id"], name: "index_admins_def_admins_on_admin_id_and_def_admin_id"
    t.index ["admin_id"], name: "index_admins_def_admins_on_admin_id"
    t.index ["def_admin_id"], name: "index_admins_def_admins_on_def_admin_id"
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

  create_table "blogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.string "sting"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "picture"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "nickname", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_def_clients", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "client_id"
    t.bigint "def_client_id"
    t.index ["client_id", "def_client_id"], name: "index_clients_def_clients_on_client_id_and_def_client_id"
    t.index ["client_id"], name: "index_clients_def_clients_on_client_id"
    t.index ["def_client_id"], name: "index_clients_def_clients_on_def_client_id"
  end

  create_table "clients_services", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "client_id"
    t.integer "service_id"
    t.index ["client_id", "service_id"], name: "index_clients_services_on_client_id_and_service_id"
  end

  create_table "contact_forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "message"
    t.string "nickname"
  end

  create_table "conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "def_admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_def_admins_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_def_admins_on_name"
    t.index ["resource_type", "resource_id"], name: "index_def_admins_on_resource_type_and_resource_id"
  end

  create_table "def_clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_def_clients_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_def_clients_on_name"
    t.index ["resource_type", "resource_id"], name: "index_def_clients_on_resource_type_and_resource_id"
  end

  create_table "def_stylists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_def_stylists_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_def_stylists_on_name"
    t.index ["resource_type", "resource_id"], name: "index_def_stylists_on_resource_type_and_resource_id"
  end

  create_table "default_stylists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_default_stylists_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_default_stylists_on_name"
    t.index ["resource_type", "resource_id"], name: "index_default_stylists_on_resource_type_and_resource_id"
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

  create_table "hairstyle_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hairstyle_matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "hairstyle_request_id"
    t.integer "hairstyle_offering_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hairstyle_request_id", "hairstyle_offering_id"], name: "my_index"
  end

  create_table "hairstyle_offerings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "hairstyle_id"
    t.boolean "top_style", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id", "hairstyle_id"], name: "index_hairstyle_offerings_on_stylist_id_and_hairstyle_id"
  end

  create_table "hairstyle_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "client_id"
    t.integer "hairstyle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "hairstyle_id"], name: "index_hairstyle_requests_on_client_id_and_hairstyle_id"
  end

  create_table "hairstyle_services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "hairstyle_id"
    t.boolean "top_style", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id", "hairstyle_id"], name: "index_hairstyle_services_on_stylist_id_and_hairstyle_id"
  end

  create_table "hairstyles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "category"
    t.text "style_description", limit: 255
  end

  create_table "hairstyles_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "hairstyle_id"
    t.index ["stylist_id", "hairstyle_id"], name: "index_hairstyles_stylists_on_stylist_id_and_hairstyle_id"
  end

  create_table "personal_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
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

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "title"
    t.string "description", limit: 500
    t.string "image"
    t.text "budget"
    t.integer "client_id"
    t.integer "city_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "city_id", "service_id"], name: "index_requests_on_client_id_and_city_id_and_service_id"
  end

  create_table "responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "request_id"
    t.text "message", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_responses_on_request_id"
    t.index ["stylist_id"], name: "index_responses_on_stylist_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
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
    t.string "image"
    t.text "details", limit: 255
    t.integer "stylist_id"
    t.integer "client_id"
    t.integer "service_id"
    t.integer "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id", "client_id", "service_id"], name: "index_styles_on_stylist_id_and_client_id_and_service_id"
  end

  create_table "stylist_hairstyles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stylist_id"
    t.integer "hairstyle_id"
    t.boolean "top_style", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id", "hairstyle_id"], name: "index_stylist_hairstyles_on_stylist_id_and_hairstyle_id"
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
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "nickname", default: ""
    t.string "salon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stylists_def_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "stylist_id"
    t.bigint "def_stylist_id"
    t.index ["def_stylist_id"], name: "index_stylists_def_stylists_on_def_stylist_id"
    t.index ["stylist_id", "def_stylist_id"], name: "index_stylists_def_stylists_on_stylist_id_and_def_stylist_id"
    t.index ["stylist_id"], name: "index_stylists_def_stylists_on_stylist_id"
  end

  create_table "stylists_default_stylists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "stylist_id"
    t.bigint "default_stylist_id"
    t.index ["default_stylist_id"], name: "index_stylists_default_stylists_on_default_stylist_id"
    t.index ["stylist_id"], name: "index_stylists_default_stylists_on_stylist_id"
  end

  create_table "stylists_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "stylist_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_stylists_roles_on_role_id"
    t.index ["stylist_id", "role_id"], name: "index_stylists_roles_on_stylist_id_and_role_id"
    t.index ["stylist_id"], name: "index_stylists_roles_on_stylist_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "operator_id"
    t.string "operator_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id", "operator_type"], name: "index_users_on_operator_id_and_operator_type"
  end

  add_foreign_key "personal_messages", "conversations"
  add_foreign_key "personal_messages", "users"
end
