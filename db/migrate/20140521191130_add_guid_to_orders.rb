class AddGuidToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :guid, :string
  end
end
