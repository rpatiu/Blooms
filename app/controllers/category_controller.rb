class CategoryController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @flowers = Flower.where("category_id = ?", @category.id).page(params[:page])

    add_breadcrumb "#{@category.name.capitalize}", category_path
  end

end
