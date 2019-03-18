class RemoveStoreIdFromVouchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :vouchers, :store_id, :string
  end
end
