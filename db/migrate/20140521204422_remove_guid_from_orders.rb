class RemoveGuidFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :guid
  end
end
