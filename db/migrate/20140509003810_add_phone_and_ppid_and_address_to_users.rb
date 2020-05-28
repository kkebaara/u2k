class AddPhoneAndPpidAndAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :string
    add_column :users, :pp_id, :string
    add_column :users, :address, :text
  end
end
