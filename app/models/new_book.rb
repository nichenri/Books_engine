class NewBook < ActiveRecord::Base
  has_many :additions
  accepts_nested_attributes_for :additions
  has_many :users, through: :applications
  belongs_to :genre
end
