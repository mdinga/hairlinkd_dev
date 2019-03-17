class CreateHairstyleCategories < ActiveRecord::Migration[5.1]

  def up
    create_table :hairstyle_categories do |t|
      t.string "name"
      t.text "description"
      t.timestamps
    end
  end

  def down
    drop_table :hairstyle_categories

  end

end
