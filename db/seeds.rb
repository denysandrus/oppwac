# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if AdminUser.find_by_email('admin@alexandertinyaev.de').blank?
  AdminUser.create!(email: 'admin@alexandertinyaev.de', password: 'waccy2016', password_confirmation: 'waccy2016')
end

['individual', 'organization'].each do |role|
  Role.find_or_create_by({name: role})
end

['Grant/Scholarship', 'Conference', 'Summer School/Camp', 'Project/Initiative', 'Internship/Training', 'Exchange Program', 'Award/Contest', 'Volunteering'].each do |type|
  OpportunityType.find_or_create_by({name: type})
end

['High School', 'Bachelor', 'Masters', 'PhD', 'Other', 'Any'].each do |education|
  Education.find_or_create_by({name: education})
end

['Free', 'Low Cost', 'Moderate Cost'].each do |cost|
  Cost.find_or_create_by({name: cost})
end