class NewBook < ActiveRecord::Base
  has_many :applications
  accepts_nested_attributes_for :applications
  has_many :users, through: :applications
  belongs_to :genre
end
