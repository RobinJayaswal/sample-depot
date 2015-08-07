class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_line_item (product_id)
    item = line_items.find_by_product_id(product_id)
    if item
      item.quantity += 1
    else
      item = line_items.build(product_id: product_id)
    end
    item
  end
end
