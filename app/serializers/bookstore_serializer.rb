class BookstoreSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :company
end
