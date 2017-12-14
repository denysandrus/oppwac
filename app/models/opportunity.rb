class Opportunity < ApplicationRecord
  belongs_to :user
  belongs_to :opportunity_type
  belongs_to :education
  belongs_to :cost
  mount_uploader :picture, PictureUploader

  def to_s
    name
  end

  before_save do |opp|
    opp.nationality[0] = ''
    opp.residence[0] = ''
    opp.language[0] = ''
  end
end
