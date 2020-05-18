class Booking < ApplicationRecord
  belongs_to :plug
  belongs_to :user
  has_many :messages
end
