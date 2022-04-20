ActiveAdmin.register Flower do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :image, :price, :sale_price, :image, :category_id

  form do |f|
    f.semantic_errors
    # f.input :category
    f.inputs
    f.actions
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, width:"200", alt: "image") : ""
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :image, :price, :sale_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
