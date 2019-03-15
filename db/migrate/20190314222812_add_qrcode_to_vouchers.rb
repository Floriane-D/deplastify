class AddQrcodeToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_column :vouchers, :qrcode, :string
  end
end
