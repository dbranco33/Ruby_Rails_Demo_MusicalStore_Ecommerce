ActiveAdmin.register Contact do
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

permit_params :phone,
              :address,
              :email,
              :week_hours,
              :saturday_hours,
              :sunday_hours,
              :note

  form do |f|
    # Defines what are the inputs for creating a new product or for editing
    f.inputs "Contact Page Details" do
      f.input :phone
      f.input :address
      f.input :email
      f.input :week_hours
      f.input :saturday_hours
      f.input :sunday_hours
      f.input :note
    end
    f.actions
  end

end
