class AddFixToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unique_address, :string
  end
end
