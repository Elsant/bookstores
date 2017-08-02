FactoryGirl.define do
  factory :bookstorage do
    association :bookstore
    association :book
    quantity 3
  end
end
