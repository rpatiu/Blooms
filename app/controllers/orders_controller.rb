class OrdersController < ApplicationController

  def index
    if user_signed_in?
      @orders = User.find(current_user.id).orders.order('created_at DESC');
    else
      redirect_to root_path
    end

  end

end
