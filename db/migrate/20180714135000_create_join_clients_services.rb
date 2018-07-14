class CreateJoinClientsServices < ActiveRecord::Migration[5.1]

  def up
    create_table :clients_services, :id => false do |t|
      t.integer "client_id"
      t.integer "service_id"
    end
    add_index("clients_services", ["client_id", "service_id"])
  end


  def down
    drop_table :clients_services
  end

end
