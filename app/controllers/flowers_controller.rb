class FlowersController < ApplicationController


  add_breadcrumb " Flowers ", :flowers_path

  def index
    @flowers = Flower.page(params[:page])
  end

  def show
    @flower = Flower.find(params[:id])

    add_breadcrumb "#{@flower.name}", flower_path
  end

  def search
    wildcard_search = "%#{params[:searchwords]}%"
    category = "#{params[:type]}"

    if wildcard_search == "%%"
      @flowers = Flower.where("category_id = ?", category).page(params[:page])
    elsif category == "all"
      @flowers = Flower.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).page(params[:page])
    else
      @flowers = Flower.where("( name LIKE ? OR description LIKE ?) AND category_id = ?", wildcard_search, wildcard_search, category).page(params[:page])
    end
  end
end
