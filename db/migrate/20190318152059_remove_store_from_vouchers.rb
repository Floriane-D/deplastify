class RemoveStoreFromVouchers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :vouchers, :store, foreign_key: true
  end
end
