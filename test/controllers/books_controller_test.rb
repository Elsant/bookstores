require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_bookstore
    setup_publishers
    setup_books
    setup_bookstorages
    setup_expected_book
  end

  def setup_bookstore
    @bookstore = create :bookstore
  end

  def setup_publishers
    @first_publisher =  create :publisher, name: 'First Publisher'
    @second_publisher = create :publisher, name: 'Second Publisher'
  end

  def setup_books
    @book_one   = create_book 'First Book',  @first_publisher
    @book_two   = create_book 'Second Book', @first_publisher
    @book_three = create_book 'Third Book',  @second_publisher
  end

  def setup_bookstorages
    @bookstorage_one   = create_bookstorage @book_one
    @bookstorage_two   = create_bookstorage @book_two, 3
    @bookstorage_three = create_bookstorage @book_three
  end

  def create_book(title, publisher)
    create :book, title: title, publisher: publisher
  end

  def create_bookstorage(book, quantity = 0)
    create(
      :bookstorage,
      bookstore: @bookstore,
      book: book,
      quantity: quantity
      )
  end

  def setup_expected_book
    @expected_book = {
        'id' => 1,
        'title' => 'First Book',
        'publisher' => {
            'id' => 1,
            'name' => 'First Publisher'
        }
    }
  end

  teardown do
    Rails.cache.clear
  end

  test 'should get select_by_publisher' do
    get select_by_publisher_bookstore_books_url(
      bookstore_id: @bookstore, publisher_name: 'First Publisher'
    )

    assert_response :success
    assert_equal 'application/json', response.content_type
    assert_serializer(/ActiveModel::Serializer::CollectionSerializer/)

    books_by_publisher = JSON.parse(response.body)['books']
    assert_equal 2, books_by_publisher.size
    assert_equal @expected_book, books_by_publisher.first
  end

  test 'should get sold' do
    get sold_bookstore_books_url bookstore_id: @bookstore
    assert_response :success
    assert_equal 'application/json', response.content_type
    assert_serializer(/ActiveModel::Serializer::CollectionSerializer/)

    sold_books = JSON.parse(response.body)['books']
    assert_equal 2, sold_books.size
    assert_equal @expected_book, sold_books.first
  end
end
