ActiveAdmin.register Invite do
  active_admin_import

  permit_params :email, :status, :message
  index do
    selectable_column
    id_column
    column :email
    column :message
    column :status
    column :created_at
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :message
    end
    f.actions do
      f.action :submit
    end
  end
end
