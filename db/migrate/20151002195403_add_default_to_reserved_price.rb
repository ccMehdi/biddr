class AddDefaultToReservedPrice < ActiveRecord::Migration
  def change
    change_column :items, :reserved_price, :decimal, :default => 1.00
  end
end
