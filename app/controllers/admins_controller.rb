class AdminsController < ApplicationController
  skip_before_filter :authorize
  def index
    @time = Time.now
    @order_count = Order.count
  end
end
