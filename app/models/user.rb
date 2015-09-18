class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :review_books, through: :reviews, :source => 'book' 

  has_many :bookmarks
  has_many :bookmark_books, through: :bookmarks, :source => 'book'

  has_many :applications
  has_many :new_books, through: :applications
end
