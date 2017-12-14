class RenameResidenceInOpportunities < ActiveRecord::Migration[4.2]
  def change
    rename_column :opportunities, :residency, :residence
  end
end
