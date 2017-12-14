ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permittedS
  # end

  active_admin_import

  permit_params %i[email password role_id name picture organization_description date_of_birth nationality residence current_education_id looking_education_id]

  form do |f|
    f.inputs 'Users' do
      f.input :email
      f.input :password
      f.input :role_id
      f.input :name
      f.input :picture
      f.input :organization_description
      f.input :date_of_birth
      f.input :nationality
      f.input :residence
      f.input :current_education_id
      f.input :looking_education_id
    end
    f.actions
  end
end
