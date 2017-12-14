class AddRoleIdToUser < ActiveRecord::Migration[4.2]
  def change
    add_reference :users, :role, invite: true, foreign_key: true
  end
end
