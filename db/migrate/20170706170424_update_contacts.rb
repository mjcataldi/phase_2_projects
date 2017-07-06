class UpdateContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :password_hash, :string
  end
end
