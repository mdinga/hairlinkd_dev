class RolifyCreateDefClients < ActiveRecord::Migration[5.1]
  def change
    create_table(:def_clients) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:clients_def_clients, :id => false) do |t|
      t.references :client
      t.references :def_client
    end
    
    add_index(:def_clients, :name)
    add_index(:def_clients, [ :name, :resource_type, :resource_id ])
    add_index(:clients_def_clients, [ :client_id, :def_client_id ])
  end
end
