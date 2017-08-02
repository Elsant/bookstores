company = Company.find_or_create_by   name: 'First Company'
first_publisher  = Publisher.find_or_create_by name: 'First Publisher'
second_publisher = Publisher.find_or_create_by name: 'Second Publisher'

bookstore = Bookstore.create(name: 'First Bookstore', company: company)

book_first =  Book.find_or_create_by title: 'First Book',  publisher: first_publisher
book_second = Book.find_or_create_by title: 'Second Book', publisher: first_publisher
book_third  = Book.find_or_create_by title: 'Third Book',  publisher: second_publisher

book_storage1 = Bookstorage.find_or_create_by bookstore: bookstore, book: book_first
book_storage2 = Bookstorage.find_or_create_by bookstore: bookstore, book: book_second, quantity: 3
book_storage3 = Bookstorage.find_or_create_by bookstore: bookstore, book: book_third