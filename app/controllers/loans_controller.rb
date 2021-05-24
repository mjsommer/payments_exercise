class LoansController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  #All loans
  def index
    loan_set = []

    Loan.all.each do |loan|
      loan_balance = balance(loan.id)

      loan_set << [
          loan_id: loan.id,
          funded_amount: loan.funded_amount,
          outstanding_balance: loan_balance
      ]
    end

    render json: loan_set
  end

  #Individual loan
  def show
    loan_detail = Loan.find(params[:id])
    loan_balance = balance(params[:id])

    render json: {
        loan_id: loan_detail.id,
        funded_amount: loan_detail.funded_amount,
        outstanding_balance: loan_balance
    }
  end

  private

  def balance(loan_id)
    loan = Loan.where(id: loan_id).first
    funded_amount = loan ? loan.funded_amount : 0
    total_payments = Payment.where(loan_id: loan_id).sum(:payment_amount)
    funded_amount - total_payments
  end
end
