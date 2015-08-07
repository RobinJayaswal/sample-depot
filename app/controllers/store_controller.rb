class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = Time.now
    
    if session[:counter]
      session[:counter] += 1
    else
      session[:counter] = 1
    end
  end
end