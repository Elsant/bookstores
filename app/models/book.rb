class Book < ApplicationRecord
  belongs_to :publisher
  has_many :bookstorages
  has_many :bookstores, through: :bookstorages
  
  validates :title, presence: true

  scope :publisher_by_name, -> (publisher_name) { joins(:publisher).where( 'publishers.name LIKE ?',  "%#{publisher_name}%" ) }
  scope :sold, -> { joins(:bookstorages).includes(:publisher).where( 'bookstorages.quantity = 0' ) }

end
