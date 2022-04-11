class AboutController < ApplicationController
  def show
    @about = About.all.first

    add_breadcrumb "About", :about_path
  end
end
