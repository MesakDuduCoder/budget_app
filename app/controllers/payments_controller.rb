class PaymentsController < ApplicationController
    before_action :set_category only [:create]
    def index
        @payments = current_user.payments
    end

    def create
        @payment = @category.payments.build(payment_params)
        if @payment.save
            redirect_to category_payments_path
        else
            render 'new'
        end
    end

    private
    det set_category
        @category = current_user.categories.find(params[:category_id])
    end

    def payment_params
        params.require(:payment).permit(:name, :amount)
    end
end
