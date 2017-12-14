class AddFieldsToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :organization_name, :string
    add_column :users, :organization_website, :string
    add_column :users, :organization_opportunities, :string
  end
end
