class PaymentsController < ApplicationController
  before_action :set_category
  def index
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @categories = current_user.categories
    @payment = Payment.new
  end

  def create
    category_params = params[:payment][:category]
    name = params[:payment][:name]
    amount = params[:payment][:amount]

    @category = Category.find_by(name: category_params)
    @payment = current_user.payments.build(name:, amount:)
    @category.payments << @payment

    if @category.save
      redirect_to category_payments_path(@category)
    else
      render 'new'
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount).merge(category: params[:payment][:category])
  end
end
