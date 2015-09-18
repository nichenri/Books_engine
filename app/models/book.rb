class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :publisher
  belongs_to :genre
  has_many :stocks

  has_many :reviews
  has_many :review_users, through: :reviews, :source => 'user'

  has_many :bookmarks
  has_many :bookmark_users, through: :bookmarks, :source => 'user'
end
