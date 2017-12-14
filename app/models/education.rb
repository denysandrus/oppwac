class Education < ApplicationRecord
  has_many :opportunities
  has_many :current_students, class_name: 'User', foreign_key: 'current_education_id'
  has_many :potential_students, class_name: 'User', foreign_key: 'looking_education_id'

  def to_s
    name
  end
end
