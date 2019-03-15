class AddBenefitToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vouchers, :benefit, foreign_key: true
  end
end
