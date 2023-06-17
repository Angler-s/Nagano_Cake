class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name,           null: false
      t.string :postal_code,    null: false
      t.string :address,        null: false
      t.integer :delivery_fee,  null: false
      t.integer :payment,       null: false
      t.integer :amount_billed, null: false
      t.integer :status,        null: false, default: 0

      t.timestamps
    end
  end
end
