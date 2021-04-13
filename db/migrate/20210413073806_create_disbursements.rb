class CreateDisbursements < ActiveRecord::Migration[6.1]
  def change
    create_table :disbursements do |t|
      t.float :amount_payable
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
