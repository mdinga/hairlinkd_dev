class CreateService < ActiveRecord::Migration[5.1]
  def up
    
    create_table :services do |t|
      t.string "service_name"
      t.string "category"
      t.string "sub_category"
      t.integer "stylist_id"
      t.integer "client_id"
      t.integer "popularity"
      t.timestamps

    end
    add_index("services", ["stylist_id", "client_id"])
  end

  def down
    drop_table :services
  end
end
