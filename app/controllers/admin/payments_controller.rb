class Admin::PaymentsController < AdminsController
  def index
    @payment = Payment.all
  end
end

