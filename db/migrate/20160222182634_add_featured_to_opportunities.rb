class AddFeaturedToOpportunities < ActiveRecord::Migration[4.2]
  def change
    add_column :opportunities, :featured, :boolean
  end
end
