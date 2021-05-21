class AddPaymentDateToPayments < ActiveRecord::Migration[5.2]
  def up
    add_column :payments, :payment_date, :date, :null => false, :default => Date.today
  end

  def down
    remove_column :payments, :payment_date
  end
end
