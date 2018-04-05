class CreateProduct < ActiveRecord::Migration[5.1]
  def up
    create_table :products do |t|
      t.string "product_name"
      t.string "category"
      t.string "sub_category"
      t.integer "stylist_id"
      t.integer "client_id"
      t.integer "popularity"

      t.timestamps
    end
    add_index("products", ["stylist_id", "client_id"])
  end

  def down
    drop_table :products
  end
end
