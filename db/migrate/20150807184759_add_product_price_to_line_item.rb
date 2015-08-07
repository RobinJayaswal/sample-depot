class AddProductPriceToLineItem < ActiveRecord::Migration
  def up
      add_column :line_items, :price, :decimal, :precision => 8, :scale => 2

      LineItem.all.to_a.each do |lineitem|
        lineitem.update_attribute :price, lineitem.product.price
      end
    end
end
