class AddSalonToStylist < ActiveRecord::Migration[5.1]

  def up
    add_column :stylists, :salon, :string
  end

  def down
    remove_column :stylists, :salon
  end

end
