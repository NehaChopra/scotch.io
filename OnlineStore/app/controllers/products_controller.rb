class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_lines = current_order.order_lines.new
  end

  def create
    @products = Product.all
    @order_lines = current_order.order_lines.new
  end

  def index
    @products = Product.all
    @order_lines = current_order.order_lines.new
  end

end
