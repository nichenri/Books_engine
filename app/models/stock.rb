class Stock < ActiveRecord::Base
  belongs_to :book
  has_many :reservations, dependent: :destroy
end
