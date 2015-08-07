class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def line_price
    line_price = product.price * quantity
    return line_price
  end
end
