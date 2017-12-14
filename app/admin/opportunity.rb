ActiveAdmin.register Opportunity do
  active_admin_import

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
  #   permitted
  # end

  permit_params %i[name featured organization picture opportunity_type_id short_description country city deadline age_min age_max residence nationality education_id cost_id language long_description requirements_to_apply award limitations preferences website link_to_apply]
end
