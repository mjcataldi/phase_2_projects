class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null: false, limit: 64
      t.belongs_to :contact, index: true

      t.timestamps
    end
  end
end
