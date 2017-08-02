require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @bookstore = create :bookstore
    @first_publisher = FactoryGirl.create :publisher, name: 'First Publisher'
    @second_publisher = create :publisher, name: 'Second Publisher'
    @book_one = create :book, title: 'First Book', publisher: @first_publisher
    @book_two = create :book, title: 'Second Book', publisher: @first_publisher
    @book_three = create :book, title: 'Third Book', publisher: @second_publisher
    @bookstorage_one = create :bookstorage, bookstore: @bookstore, book: @book_one, quantity: 0
    @bookstorage_two = create :bookstorage, bookstore: @bookstore, book: @book_two
    @bookstorage_three = create :bookstorage, bookstore: @bookstore, book: @book_three, quantity: 0

    @expected_book = {
                      "id"=>1, 
                      "title"=>"First Book", 
                      "publisher"=>{
                        "id"=>1, 
                        "name"=>"First Publisher"
                      }
                    }
  end

  test "should get select_by_publisher" do

    get select_by_publisher_bookstore_books_url bookstore_id: @bookstore, publisher_name: "First Publisher"

    assert_response :success
    assert_equal "application/json", response.content_type
    assert_serializer /ActiveModel::Serializer::CollectionSerializer/

    books_by_publisher = JSON.parse(response.body)['books']
    assert_equal 2, books_by_publisher.size
    assert_equal @expected_book, books_by_publisher.first
  end

  test "should get sold" do
    get sold_bookstore_books_url bookstore_id: @bookstore
    assert_response :success
    assert_equal "application/json", response.content_type
    assert_serializer /ActiveModel::Serializer::CollectionSerializer/

    sold_books = JSON.parse(response.body)['books']
    assert_equal 2, sold_books.size
    assert_equal @expected_book, sold_books.first
  end
end
