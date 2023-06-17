class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false

      t.timestamps
    end
  end
end
