class CartController < ApplicationController

  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include? (id)
      session[:shopping_cart][id] = 1 # push id onto the end of the cart array
      product = Flower.find(id)
      flash[:notice] = "+ #{product.name} added to cart."

      redirect_to root_path
    end

  end

  def update
    id = params[:id].to_i
    quantity = params[:quantity].to_i

    if (quantity < 1)
      session[:shopping_cart].delete(id)
    else
      session[:shopping_cart]["#{id}"] = quantity;
    end

    redirect_to cart_index_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete("#{id}")
    product = Flower.find(id)
    flash[:notice] = "- #{product.name} removed from cart."
    redirect_to root_path
  end

  def index
   @cart = Flower.find(session[:shopping_cart].keys)
  end

  def checkout
    items = session[:shopping_cart]
    subtotal = params[:subtotal]
    pst = params[:pst]
    gst = params[:gst]
    hst = params[:hst]
    total = params[:total]
    status = "paid"

    if user_signed_in?
      order = Order.create(
        subtotal: subtotal,
        pst:      pst,
        gst:      gst,
        hst:      hst,
        status:   status,
        total:    total,
        user:     current_user
      )

      if order && order.valid?
        items.each do |id, quantity|
          flower = Flower.find(id)
          price = flower.price
          if(flower.sale_price.present?)
            price = flower.sale_price
          end

          cart_items = order.cart_items.create(
            price: price,
            quantity: quantity,
            flower_id: id
          )

        end

        session[:shopping_cart].clear
      end

      flash[:notice] = "Order Completed!"
      redirect_to home_index_path
    else
      redirect_to new_user_session_path
    end


  end

end
