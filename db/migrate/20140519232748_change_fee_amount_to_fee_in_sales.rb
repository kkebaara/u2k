class ChangeFeeAmountToFeeInSales < ActiveRecord::Migration
  change_table :sales do |t|
    t.rename :fee_amount, :amount
  end
end
