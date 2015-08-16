class AdminsController < ApplicationController
  def index
    @time = Time.now
    @order_count = Order.count
  end
end
