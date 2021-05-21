class CreatePayments < ActiveRecord::Migration[5.2]
  def up
    create_table :payments do |t|
      t.references :loan, foreign_key: true
      t.decimal :payment_amount, precision: 8, scale: 2
      t.timestamps null: false
    end
  end

  def down
    drop_table :payments
  end
end
