class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
  belongs_to :reservation_status
end
