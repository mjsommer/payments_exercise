Loan.create!(funded_amount: 100.0)

Payment.create!(loan_id: Loan.first.id ,payment_amount: 50.0, payment_date: Date.today)
Payment.create!(loan_id: Loan.first.id ,payment_amount: 25.0, payment_date: Date.today)
Payment.create!(loan_id: Loan.first.id ,payment_amount: 10.0, payment_date: Date.today)
