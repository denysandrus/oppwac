class CreateOpportunities < ActiveRecord::Migration[4.2]
  def change
    create_table :opportunities do |t|
      t.string :name
      t.string :organization
      t.integer :opportunity_type
      t.text :short_description
      t.string :country
      t.string :city
      t.datetime :deadline
      t.integer :age_min
      t.integer :age_max
      t.string :residency
      t.string :nationality
      t.integer :education
      t.integer :cost
      t.string :language
      t.text :long_description
      t.text :requirements_to_apply
      t.text :award
      t.text :limitations
      t.text :preferences
      t.string :website
      t.string :link_to_apply

      t.timestamps null: false
    end
  end
end
