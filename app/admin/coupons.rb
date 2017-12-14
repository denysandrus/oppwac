ActiveAdmin.register Coupon do
  active_admin_import
  permit_params :code, :usage_limit
  index do
    selectable_column
    id_column
    column :code
    column :usage_limit
    column :status
    column :created_at
    actions
  end

  form do |f|
    f.inputs 'Generate Promo Code' do
      f.input :code
      f.input :usage_limit
    end
    f.actions do
      f.action :submit
    end
  end
end
