require 'hanami/interactor'

module Bookshelf
  module Operations
    module Books
      class Delete
        include Hanami::Interactor
        include Deps['repositories.books']

        def call(book_id)
          error('Book not found') unless books.delete(book_id) > 0
        end
      end
    end
  end
end
