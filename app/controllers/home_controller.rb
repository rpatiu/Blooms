class HomeController < ApplicationController


  def index
    @flowers = Flower.page(params[:page]);

    add_breadcrumb "All", index_path
  end

  def sale
    @flowers = Flower.where("sale_price IS NOT NULL").page(params[:page])

    add_breadcrumb "Sale", sale_path
  end

  def new
    three_days_ago = DateTime.now - 3.days
    @flowers = Flower.where("created_at > ?", three_days_ago).page(params[:page])

    add_breadcrumb "New", sale_path
  end
end
