class Company < ApplicationRecord
  has_many :bookstores
  
  validates :name, presence: true
end
