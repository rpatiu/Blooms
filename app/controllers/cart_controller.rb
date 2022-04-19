class CartController < ApplicationController

  def create
    logger.debug("Adding #{param[:id]} to cart.")
  end

  def destroy

  end

end
