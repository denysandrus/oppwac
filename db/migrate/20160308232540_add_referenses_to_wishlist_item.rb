class AddReferensesToWishlistItem < ActiveRecord::Migration[4.2]
  def change
    add_column :wishlist_items, :opportunity_id, :integer
    add_column :wishlist_items, :user_id, :integer
  end
end
