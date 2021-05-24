require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(funded_amount: 100.0) }
  let(:payment) { Payment.create!(loan_id: loan.id ,payment_amount: 25.0, payment_date: Date.today)}

  describe '#index' do
    it 'responds with a 200' do
      get :index, params: {loan_id: loan.id }


      # get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'responds with a 200' do
      get :show, params: { id: payment.id, loan_id: loan.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 10000, loan_id: loan.id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
