class Genre < ActiveRecord::Base
  has_many :books
  has_many :new_books
end
