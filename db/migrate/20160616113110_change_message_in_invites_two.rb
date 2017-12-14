class ChangeMessageInInvitesTwo < ActiveRecord::Migration[4.2]
  def change
    change_column_default :invites,  :message, 'We know you change the World.
 Perhaps you need some help?
  World At Competition connects Organizations that offer Opportunities with active Youth in order to power their impact. Do you want to know how?'
  end
end
