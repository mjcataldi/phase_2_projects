class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false, limit: 64
      t.string :last_name, null:false, limit: 64
      t.string :email, null: false, limit: 64

      t.timestamps
    end
  end
end
