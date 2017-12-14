class AddAdditionalFieldsToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :organization_description, :text
    add_column :users, :date_of_birth, :date, invite: true
    add_column :users, :nationality, :string, invite: true
    add_column :users, :residence, :string, invite: true
    add_column :users, :current_education_id, :integer, invite: true, foreign_key: true
    add_column :users, :looking_education_id, :integer, invite: true, foreign_key: true
  end
end
