class CreateServices < ActiveRecord::Migration[5.1]
  def up

      create_table :services do |t|
      t.string "name"
      t.string "category"
      t.text "description", :limit => 150

    end
  end

  def down
    drop_table :services

  end

end
