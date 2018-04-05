class CreateHairstylesStylists < ActiveRecord::Migration[5.1]

  def up
    create_table :hairstyles_stylists, :id => false do |t|
      t.integer "stylist_id"
      t.integer "hairstyle_id"
    end
    add_index("hairstyles_stylists",["stylist_id", "hairstyle_id"])

  end

  def down
    drop_table :hairstyles_stylists
  end

end
