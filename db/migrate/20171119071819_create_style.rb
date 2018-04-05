class CreateStyle < ActiveRecord::Migration[5.1]
  def up
    create_table :styles do |t|
      t.string "style_name"
      t.string "category"
      t.string "sub_category"
      t.text "details", :limit  => 100
      t.integer "stylist_id"
      t.integer "client_id"
      t.integer "popularity"
      #image added with another migration
      ## Need to consider adding picture source, since it is not mine

      t.timestamps
    end
    add_index("styles", ["stylist_id", "client_id"])
  end

  def down
    drop_table :styles
  end
end
