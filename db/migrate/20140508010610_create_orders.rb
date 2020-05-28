class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :tracking
      t.text :description
      t.string :status
      t.decimal :value
      t.decimal :fee
      t.references :user, index: true

      t.timestamps
    end
  end
end
