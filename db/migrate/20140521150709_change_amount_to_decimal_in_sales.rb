class ChangeAmountToDecimalInSales < ActiveRecord::Migration
  def change
    change_column :sales, :amount, :decimal, :precision => 9, :scale => 2
  end
end
