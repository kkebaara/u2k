class ChangeOrderIdToStringInSales < ActiveRecord::Migration
  def change
    add_column :sales, :order_id_tmp, :uuid
    remove_column :sales, :order_id
    rename_column :sales, :order_id_tmp, :order_id
  end
end
