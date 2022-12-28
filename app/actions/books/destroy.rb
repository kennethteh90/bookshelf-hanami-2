# frozen_string_literal: true

require 'debug/open_nonstop'
module Bookshelf
  module Actions
    module Books
      class Destroy < Bookshelf::Action
        include Deps[delete_book: 'operations.books.delete']

        params do
          required(:id).filled(:integer)
        end

        def handle(request, response)
          halt 422 unless request.params.valid?

          result = delete_book.call(request.params[:id])
          halt 404 unless result.success?

          if request.accept == 'application/json'
            response.status = 204
          else
            response.redirect_to(Hanami.app["routes"].path(:books))
          end
        end
      end
    end
  end
end
