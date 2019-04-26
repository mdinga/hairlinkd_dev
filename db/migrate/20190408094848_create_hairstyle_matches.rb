class CreateHairstyleMatches < ActiveRecord::Migration[5.1]


  def up
    create_table :hairstyle_matches do |t|
      t.integer :hairstyle_request_id
      t.integer :hairstyle_offering_id

      t.timestamps
    end
    add_index "hairstyle_matches", ["hairstyle_request_id", "hairstyle_offering_id"], :name => "my_index"
  end

  def down
    drop_table :hairstyle_matches
  end


end
