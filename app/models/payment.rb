class Payment < ActiveRecord::Base
  belongs_to :loan

  validate :payment_does_not_exceed_balance

  def payment_does_not_exceed_balance
    loan = Loan.where(id: self.loan_id).first
    funded_amount = loan ? loan.funded_amount : 0
    total_payments = Payment.where(loan_id: self.loan_id).sum(:payment_amount)
    current_balance = funded_amount - total_payments

    if current_balance - self.payment_amount < 0
      errors.add(:payment_amount, "A payment should not be exceed the outstanding balance of a loan")
    end
  end
end
