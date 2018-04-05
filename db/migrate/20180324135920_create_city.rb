class CreateCity < ActiveRecord::Migration[5.1]
  def up
    create_table :cities do |t|
      t.string "city"
    end
  end

  def down
    drop_table :cities
  end
end
