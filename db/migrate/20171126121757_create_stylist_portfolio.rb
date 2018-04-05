class CreateStylistPortfolio < ActiveRecord::Migration[5.1]

  def up
    create_table :portfolios do |t|
      t.string "image"
      t.integer "stylist_id"
      t.integer "service_id"
      t.text "details", :limit => 500
    end
    add_index("portfolios", ["stylist_id", "service_id"])
  end

  def down
    drop_table :portfolios
  end


end
