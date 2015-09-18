class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :new_book
  belongs_to :application_status
end
