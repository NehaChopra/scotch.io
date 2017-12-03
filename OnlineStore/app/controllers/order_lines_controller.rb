class OrderLinesController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_lines.new(order_line_params)
    @order[:customer_id] = 1
    @order[:date] = Time.now.utc
    @order.save
    session[:order_id] = @order.id
  end

  def update
  end

  def destroy
  end

  private
  def order_line_params
    params.require(:order_line).permit(:qty, :product_id)
  end
end
