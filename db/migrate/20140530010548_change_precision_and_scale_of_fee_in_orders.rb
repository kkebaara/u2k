class ChangePrecisionAndScaleOfFeeInOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :fee, :decimal, { :precision => 10, :scale => 2 }
  end

  def self.down
    change_column :orders, :fee, :decimal
  end
end
