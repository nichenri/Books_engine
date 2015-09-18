class ReservationStatus < ActiveRecord::Base
  has_many :reservations
end
