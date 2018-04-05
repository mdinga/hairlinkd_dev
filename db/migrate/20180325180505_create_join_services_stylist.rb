class CreateJoinServicesStylist < ActiveRecord::Migration[5.1]
  def up
    create_table :services_stylists, :id => false do |t|
      t.integer "service_id"
      t.integer "stylist_id"
    end
    add_index("services_stylists", ["service_id", "stylist_id"])
  end

  def down
    drop_table :services_stylists
  end
end
