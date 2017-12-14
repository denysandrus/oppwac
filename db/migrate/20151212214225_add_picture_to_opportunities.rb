class AddPictureToOpportunities < ActiveRecord::Migration[4.2]
  def change
    add_column :opportunities, :picture, :string
  end
end
