class ChangeIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :items, :price, :float
  end
end
