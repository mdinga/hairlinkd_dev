class CreateResponses < ActiveRecord::Migration[5.1]
  def up
    create_table :responses do |t|
      t.integer :stylist_id
      t.integer :request_id
      t.text :message, :limit => 250

      t.timestamps
    end
    add_index :responses, :stylist_id
    add_index :responses, :request_id
  end

  def down
    drop_table :responses
  end

end
