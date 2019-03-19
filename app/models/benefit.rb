class Benefit < ApplicationRecord
  belongs_to :store
  has_many :vouchers, :dependent => :destroy
end
