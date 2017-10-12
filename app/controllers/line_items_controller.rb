require 'pry'

class LineItemsController < ApplicationController

  def create
    if current_user
      cart = get_current_cart
      cart.add_item(params[:item_id]).save
      
      redirect_to cart_path(get_current_cart)
    else
      redirect_to "/"
    end
  end
end
