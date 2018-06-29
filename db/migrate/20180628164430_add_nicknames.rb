class AddNicknames < ActiveRecord::Migration[5.1]


  def up
    add_column :stylists, :nickname, :string
    add_column :clients, :nickname, :string
    add_column :admins, :nickname, :string
  end

  def down
    remove_column :stylists, :nickname, :string
    remove_column :clients, :nickname, :string
    remove_column :admins, :nickname, :string
  end

end
