class CreateStylist < ActiveRecord::Migration[5.1]

def up

  create_table :stylists do |t|
    t.integer "user_id"
    t.string "avatar"
    t.string "username", :limit => 20
    t.string "name"
    t.string "surname"
    t.string "password_digest"
    t.float "overall_rating", :default => 0.0, :precision => 1
    t.boolean "house_calls", :default => false
    t.text "about_me", :limit =>500
    t.string "phone"
    t.string "email"
    t.string "facebook_link"
    t.string "instagram_link"
    t.string "role"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "nickname", :default => ""
    t.string "salon"


    t.timestamps
  end
  add_index("stylists", "user_id")

end

def down
  drop_table :stylists
end

end
