class CreateArea < ActiveRecord::Migration[5.1]
  def up
    create_table :areas do |t|
      t.integer "city_id"
      t.string "name"
    end
    add_index("areas", "city_id")
  end

  def down
    drop_table :areas
  end

end
