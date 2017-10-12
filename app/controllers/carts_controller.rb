class CartsController < ApplicationController

    def checkout
      @cart = Cart.find(params[:id])
      @cart.status = "submitted"
      @cart.save
      current_user.current_cart = nil
      current_user.save

      Item.adjust_inventory(@cart)

      redirect_to cart_path(@cart)
    end

    def show
      @cart = Cart.find(params[:id])
    end

end
