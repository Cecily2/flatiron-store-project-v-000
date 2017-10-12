require 'pry'
class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0
    self.line_items.each do |i|
      i.quantity.times do
        total += i.item.price
      end
    end
    total
  end

  def add_item(id)
    if item = self.line_items.find_by(item_id: id)
      item.quantity += 1
      item.save
      item
    else
      LineItem.new(item_id: id, cart_id: self.id)
    end
  end


end
