class Voucher < ApplicationRecord
  belongs_to :user
  belongs_to :benefit
  has_one :qrcode
end
