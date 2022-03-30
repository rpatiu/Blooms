class FlowersController < ApplicationController
  def index
    @flowers = Flower.page(params[:page])
  end

  def show
    @flower = Flower.find(params[:id])
  end
end
