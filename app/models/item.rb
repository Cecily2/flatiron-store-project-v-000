class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items


  def get_price
    self.price.to_f / 100
  end

  def self.available_items
    where("inventory > 0")
  end

  def self.adjust_inventory(cart)
    cart.line_items.each do |i|
      item = Item.find(i.item_id)
      item.inventory -= i.quantity
      item.save
    end
  end
end
