class ChangeOpportunityAssociations < ActiveRecord::Migration[4.2]
  def change
    remove_column :opportunities, :opportunity_type
    add_reference :opportunities, :opportunity_type, invite: true, foreign_key: true

    remove_column :opportunities, :education
    add_reference :opportunities, :education, invite: true, foreign_key: true

    remove_column :opportunities, :cost
    add_reference :opportunities, :cost, invite: true, foreign_key: true
  end
end
