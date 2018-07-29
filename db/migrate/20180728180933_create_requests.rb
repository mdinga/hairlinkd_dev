class CreateRequests < ActiveRecord::Migration[5.1]
  def up
    create_table :requests do |t|
      t.text :title
      t.string :description, :limit =>500
      t.string :image
      t.text :budget
      t.integer :client_id
      t.integer :city_id
      t.integer :service_id

      t.timestamps
    end
    add_index("requests", ["client_id", "city_id", "service_id"])
  end

  def down
    drop_table :requests
  end
end
