class CartController < ApplicationController

  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include? (id)
      session[:shopping_cart] << id # push id onto the end of the cart array
      product = Flower.find(id)
      flash[:notice] = "+ #{product.name} added to cart."
      redirect_to root_path
    end


  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Flower.find(id)
    flash[:notice] = "- #{product.name} removed from cart."
    redirect_to root_path
  end

end
