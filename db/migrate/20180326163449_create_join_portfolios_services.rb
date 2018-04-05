class CreateJoinPortfoliosServices < ActiveRecord::Migration[5.1]

  def up
    create_table :portfolios_services do |t|
      t.integer "portfolio_id"
      t.integer "service_id"
    end
    add_index("portfolios_services", ["portfolio_id", "service_id"])
  end

  def down
    drop_table :portfolios_services

  end

end
