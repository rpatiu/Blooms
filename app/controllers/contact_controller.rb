class ContactController < ApplicationController
  def show
    @contact = Contact.all.first

    add_breadcrumb "Contact", :contact_path
  end
end
