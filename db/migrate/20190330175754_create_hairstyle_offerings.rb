class CreateHairstyleOfferings < ActiveRecord::Migration[5.1]

  def up
    create_table :hairstyle_offerings do |t|
      t.integer "stylist_id"
      t.integer "hairstyle_id"
      t.boolean "top_style", :default => false

      t.timestamps
    end
    add_index("hairstyle_offerings", ["stylist_id", "hairstyle_id"])
  end

  def down
    drop_table :hairstyle_offerings
  end

end
