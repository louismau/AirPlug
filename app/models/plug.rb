class Plug < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :address, presence: true
  validates :price, presence: true
  validates :ac_dc, presence: true
  validates :type_plug, presence: true
  validates :power, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
