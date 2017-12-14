class AddFieldsToUserTwo < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :verification_status, :string
  end
end
