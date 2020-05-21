class Plug < ApplicationRecord
  PLUG_TYPE = ['Type 2', 'Type 3C', 'Type 1', 'CHAdeMO', 'Combo CCS', 'P17' ]
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :address, presence: true
  validates :price, presence: true
  validates :ac_dc, presence: true, inclusion: { in: ['AC', 'DC'] }
  validates :type_plug, presence: true, inclusion: { in: PLUG_TYPE }
  validates :power, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
