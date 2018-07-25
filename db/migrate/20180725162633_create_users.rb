class CreateUsers < ActiveRecord::Migration[5.1]

  def up

    create_table :users do |t|
      t.string :name
      t.integer :operator_id
      t.string :operator_type
      t.timestamps
    end
    add_index :users, [:operator_id, :operator_type]
  end

  def down
    drop_table :users
  end
end
