require 'dry/monads'

module Bookshelf
  module Operations
    module Books
      class Delete
        include Dry::Monads[:result]
        include Deps['repositories.books']

        def call(book_id)
          return Failure('Book not found') unless books.delete(book_id).positive?

          Success(book_id)
        end
      end
    end
  end
end
