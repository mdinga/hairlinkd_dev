class CreatePersonalMessages < ActiveRecord::Migration[5.1]
  def up
    create_table :personal_messages do |t|
      t.integer :conversation_id
      t.text :body, :limit  => 100
      t.integer :chatter_id
      t.string :chatter_type
      t.timestamps
    end
    add_index("personal_messages", ["conversation_id", "chatter_id"])
  end

  def down
    drop_table :personal_messages
  end

end
