class Store < ApplicationRecord
  belongs_to :user

  has_many :working_hours, :dependent => :destroy
  has_many :benefits, :dependent => :destroy
  has_many :vouchers, through: :benefits

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
