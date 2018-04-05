class CreateFavStylists < ActiveRecord::Migration[5.1]
  def up
    create_table :fav_stylists do |t|
      t.integer "stylist_id"
      t.integer "client_id"
    end
    add_index("fav_stylists", ["stylist_id", "client_id"])
  end

  def down
    drop_table :fav_stylists
  end

end
