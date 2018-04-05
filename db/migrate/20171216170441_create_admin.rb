class CreateAdmin < ActiveRecord::Migration[5.1]

  def up
    create_table :admins do |t|
      t.string "name"
      t.string "surname"
      t.string "email"
      t.string "password_digest", :string
      t.string "role"
      t.timestamps

    end
  end

  def down
    drop_table :admins
  end

end
