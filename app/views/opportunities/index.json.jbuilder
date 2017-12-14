json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :name, :organization, :picture_url, :opportunity_type, :short_description, :country, :city, :deadline, :age_min, :age_max, :residence, :nationality, :education, :cost, :language, :long_description, :requirements_to_apply, :award, :limitations, :preferences, :website, :link_to_apply
  json.url opportunity_url(opportunity, format: :json)
end
