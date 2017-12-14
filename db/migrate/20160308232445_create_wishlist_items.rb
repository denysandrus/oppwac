class CreateWishlistItems < ActiveRecord::Migration[4.2]
  def change
    create_table :wishlist_items do |t|

      t.timestamps null: false
    end
  end
end
