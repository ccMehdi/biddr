class ChangePriceColName < ActiveRecord::Migration
  def change
    rename_column :items, :price, :reserved_price
  end
end
