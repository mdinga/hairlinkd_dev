class RolifyCreateDefStylists < ActiveRecord::Migration[5.1]
  def change
    create_table(:def_stylists) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:stylists_def_stylists, :id => false) do |t|
      t.references :stylist
      t.references :def_stylist
    end
    
    add_index(:def_stylists, :name)
    add_index(:def_stylists, [ :name, :resource_type, :resource_id ])
    add_index(:stylists_def_stylists, [ :stylist_id, :def_stylist_id ])
  end
end
