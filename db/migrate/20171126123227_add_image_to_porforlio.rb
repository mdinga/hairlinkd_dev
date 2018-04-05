class AddImageToPorforlio < ActiveRecord::Migration[5.1]

  def up
    add_column :portfolios, :image, :string
  end

  def down
    remove_column :portfolios, :image
  end

end
