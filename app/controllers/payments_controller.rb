class PaymentsController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    Payment.create!(loan_id: params[:loan_id] ,payment_amount: params[:amount], payment_date: params[:payment_date])
  end
end
