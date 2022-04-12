class CategoryController < ApplicationController

  def show
    @category = Category.find(params[:id])

    add_breadcrumb "#{@category.name.capitalize}", category_path
  end

end
