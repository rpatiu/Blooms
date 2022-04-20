class ItemsController < ApplicationController

  def show
    if user_signed_in?
      @items = Order.find(params[:id].to_i).cart_items
      @order = Order.find(params[:id].to_i)
    else
      redirect_to root_path
    end
  end
end
