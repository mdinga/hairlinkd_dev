class CreateJoinCitiesClients < ActiveRecord::Migration[5.1]
  def up
    create_table :cities_clients, :id => false do |t|
      t.integer "city_id"
      t.integer "client_id"
    end
    add_index("cities_clients", ["city_id", "client_id"])
  end

  def down
    drop_table :cities_clients
  end
end
