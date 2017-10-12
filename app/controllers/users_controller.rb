class UsersController < ApplicationController
  def show
    session.clear
    redirect_to "/"
  end
end