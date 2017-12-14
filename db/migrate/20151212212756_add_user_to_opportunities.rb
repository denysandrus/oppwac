class AddUserToOpportunities < ActiveRecord::Migration[4.2]
  def change
    add_reference :opportunities, :user, invite: true, foreign_key: true
  end
end
