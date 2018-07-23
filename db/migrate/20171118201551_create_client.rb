class CreateClient < ActiveRecord::Migration[5.1]

  def up

    create_table :clients do |t|
      t.integer "user_id"
      t.string "username", :limit => 20
      t.string "name"
      t.string "surname"
      t.string "email"
      t.string "password_digest"
      t.string "role"
      t.string "picture"
      t.string "password_reset_token"
      t.datetime "password_reset_sent_at"
      t.string "nickname", :default => ""

      t.timestamps
    end
    add_index("clients", "user_id")
  end

  def down
    drop_table :clients
  end

end
