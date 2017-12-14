class CreateInvites < ActiveRecord::Migration[4.2]
  def change
    create_table :invites do |t|
      t.string :email
      t.string :status, :default => 'inactive'
      t.string :message, :default => 'We know you change the World. Perhaps you need some help? World At Competition connects Organizations that offer Opportunities with active Youth in order to power their impact. Do you want to know how?'
      t.timestamps null: false
    end
  end
end
