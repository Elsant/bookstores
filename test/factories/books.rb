FactoryGirl.define do
  factory :book do
    title "Book"
    association :publisher
  end
end
