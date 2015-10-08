class AddCurrentBidToItem < ActiveRecord::Migration
  def change
    add_column :items, :current_bid, :float
  end
end
