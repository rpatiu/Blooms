class HomeController < ApplicationController
  def index
    @flowers = Flower.page(params[:page]);
  end
end
