class ChangeCurrentPriceFromFloatToDecimal < ActiveRecord::Migration
  def change
    change_column :items, :current_bid, :decimal
  end
end
