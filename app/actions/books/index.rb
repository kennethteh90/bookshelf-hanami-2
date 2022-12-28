# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Index < Bookshelf::Action
        include Deps['repositories.books']

        def handle(*, response)
          all_books = books.all
          response.body = all_books.map(&:to_h).to_json
          response.format = :json
        end
      end
    end
  end
end
