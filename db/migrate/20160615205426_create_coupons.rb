class CreateCoupons < ActiveRecord::Migration[4.2]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :usage_limit, :default => 1
      t.string :status, :default => 'active'
      t.timestamps null: false
    end
  end
end
