class RolifyCreateDefAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table(:def_admins) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:admins_def_admins, :id => false) do |t|
      t.references :admin
      t.references :def_admin
    end
    
    add_index(:def_admins, :name)
    add_index(:def_admins, [ :name, :resource_type, :resource_id ])
    add_index(:admins_def_admins, [ :admin_id, :def_admin_id ])
  end
end
