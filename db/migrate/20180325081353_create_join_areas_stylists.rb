class CreateJoinAreasStylists < ActiveRecord::Migration[5.1]
  def up
    create_table :areas_stylists, :id => false do |t|
      t.integer "area_id"
      t.integer "stylist_id"
    end
    add_index("areas_stylists", ["area_id", "stylist_id"])
  end

  def down
    drop_table :areas_stylists
  end
end
