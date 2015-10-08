class AddMaxBidColumn < ActiveRecord::Migration
  def change
    add_column :items, :max_bid, :decimal
  end
end
