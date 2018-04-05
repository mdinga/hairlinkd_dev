class AddImageToStyles < ActiveRecord::Migration[5.1]

  def up
    add_column :styles, :image, :string
  end

  def down

    remove_column :styles, :image
  end
end
