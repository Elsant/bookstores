class Bookstore < ApplicationRecord
  belongs_to :company, dependent: :destroy
  has_many :bookstorages
  has_many :books, through: :bookstorages

  validates :name, presence: true
end
