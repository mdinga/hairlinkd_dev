class CreateContactForm < ActiveRecord::Migration[5.1]
  def up
    create_table :contact_forms do |t|
      t.string "name"
      t.string "email"
      t.string "phone"
      t.text "message"
      t.string "nickname"
    end
  end

  def down
  drop_table :contact_forms

  end
end
