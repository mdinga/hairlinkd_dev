class CreateHairstyleRequests < ActiveRecord::Migration[5.1]
  def up
    create_table :hairstyle_requests do |t|
        t.integer "client_id"
        t.integer "hairstyle_id"
      t.timestamps
    end
    add_index("hairstyle_requests", ["client_id", "hairstyle_id"])
  end

  def down
    drop_table :hairstyle_requests
  end
end
