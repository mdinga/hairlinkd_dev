class CreateHairstyles < ActiveRecord::Migration[5.1]
  def up

    create_table :hairstyles do |t|
      t.string "hairstyle"
      t.integer "hairstyle_category_id"
      t.text "style_description", :limit => 150
    end
  end

  def down
    drop_table :hairstyles
  end
end
