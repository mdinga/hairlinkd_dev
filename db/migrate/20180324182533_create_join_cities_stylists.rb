class CreateJoinCitiesStylists < ActiveRecord::Migration[5.1]
  def up
    create_table :cities_stylists, :id => false do |t|
      t.integer "city_id"
      t.integer "stylist_id"
    end
    add_index("cities_stylists", ["city_id", "stylist_id"])
  end

  def down
    drop_table :cities_stylists
  end
end
