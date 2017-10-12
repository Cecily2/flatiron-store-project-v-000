require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_current_cart

  def get_current_cart
    if current_user
      if current_user.current_cart_id
        Cart.find(current_user.current_cart_id)
      else
        cart = Cart.create(user: current_user)
        current_user.current_cart_id = cart.id
        current_user.save
        cart
      end
    end
   end

   
end
