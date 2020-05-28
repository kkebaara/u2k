class TransactionsController < ApplicationController
  skip_before_action :authenticate_user!,
    only: [:new, :create]

  def new
    @order = Order.find_by!(
      tracking: params[:tracking]
    )
  end

  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @order = @sale.order
  end

  def create
    @order = Order.find_by!(
      tracking: params[:tracking]
    )

    sale = @order.sales.create!(
      amount:     @order.fee,
      email:      params[:email],
      stripe_token: params[:stripeToken]
    )
    sale.process!
    if sale.finished?
      redirect_to pickup_url(guid: sale.guid)
    else
      flash.now[:alert] = sale.error
      render :new
    end
  end
end
