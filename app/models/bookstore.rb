class Bookstore < ApplicationRecord
  belongs_to :company, dependent: :destroy
  
  validates :name, presence: true
end
