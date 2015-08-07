class CombineItemsInCart < ActiveRecord::Migration
  def up
      # replace multiple items for a single product in a cart with a single item
      Cart.all.each do |cart|
        # count the number of each product in the cart
        sums = cart.line_items.group(:product_id).sum(:quantity)

        sums.each do |product_id, quantity|
          if quantity > 1
            # remove individual items
            cart.line_items.where(product_id: product_id).delete_all

            # replace with a single item
            item = cart.line_items.build(product_id: product_id)
            item.quantity = quantity
            item.save!
          end
        end
      end
  end
  
  # def down
  #     LineItem.where("quantity>1").each do |line_item|
  #       line_item.quantity.times do
  #         LineItem.create(cart_id: line_item.cart_id, product_id: line_item.product_id)
  #       end
  #
  #       line_item.destroy
  #     end
  # end
    
      
  # def up
  #   Cart.all.each do |cart|
  #     sums = cart.line_items.group(:product_id).sum(:quantity)
  #
  #     sums.each do |product, quantity|
  #       if quantity > 1
  #         cart.line_items.where(product_id: product).delete_all
  #
  #         cart.line_items.create(product_id: product, quantity: quantity)
  #       end
  #     end
  #   end
  # end
end