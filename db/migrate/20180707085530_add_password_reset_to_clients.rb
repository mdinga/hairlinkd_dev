class AddPasswordResetToClients < ActiveRecord::Migration[5.1]
  def up
    add_column :clients, :password_reset_token, :string
    add_column :clients, :password_reset_sent_at, :datetime
  end

  def down
    remove_column :clients, :password_reset_token, :string
    remove_column :clients, :password_reset_sent_at, :datetime
  end
end
