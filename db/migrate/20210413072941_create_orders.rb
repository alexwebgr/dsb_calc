class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :amount
      t.datetime :completed_at
      t.references :merchant, null: false, foreign_key: true
      t.references :shopper, null: false, foreign_key: true

      t.timestamps
    end
  end
end
