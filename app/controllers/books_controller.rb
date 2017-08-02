class BooksController < ApplicationController
  before_action :set_bookstore, only: [:select_by_publisher, :sold]

  def select_by_publisher
    @books_by_publisher = @bookstore.books.publisher_by_name(params[:publisher_name])
    if stale?(@books_by_publisher)
      render json: @books_by_publisher, include: [:publisher]
    end
  end

  def sold
    @sold_books = @bookstore.books.sold
    if stale?(@sold_books)
      render json: @sold_books, include: [:publisher]
    end
  end

  private
    def set_bookstore
      @bookstore = Bookstore.find(params[:bookstore_id])
    end
end
