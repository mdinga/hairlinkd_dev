class CreateJoinAreasClients < ActiveRecord::Migration[5.1]
  def up
    create_table :areas_clients, :id => false do |t|
      t.integer "area_id"
      t.integer "client_id"
    end
    add_index("areas_clients", ["area_id", "client_id"])
  end

  def down
    drop_table :areas_clients
  end
end
