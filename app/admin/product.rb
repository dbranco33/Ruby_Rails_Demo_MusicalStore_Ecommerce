ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  # parameters permitted to be changed by activeadmin
  permit_params :name,
                :brand,
                :active,
                :status,
                :price,
                :stock_quantity,
                :image,
                :category_id,
                :description

  # Defines product's fields showed in the 'index' products page.
  index do
    selectable_column
    id_column
    column :name
    column :brand
    column :category
    column :active
    column :status
    column :price
    column :stock_quantity
    column 'Image', sortable: :image_file_name do |prod| link_to prod.image_file_name, prod.image.url end
    column :description
    actions # gives me the 'view', 'edit', 'delete'
  end

  form do |f|
    # Defines what are the inputs for creating a new product or for editing
    f.inputs "Product Details" do
      f.input :name
      f.input :brand
      f.input :category
      f.input :active
      f.input :status
      f.input :price
      f.input :stock_quantity
      f.input :image, as: :file, required:false,:hint => image_tag(f.object.image.url(:thumb))
      f.input :description
    end
    f.actions
  end
end
