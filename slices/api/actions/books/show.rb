# frozen_string_literal: true

module API
  module Actions
    module Books
      class Show < API::Action
        include Deps['repositories.books']

        def handle(request, response)
          book = books.find(request.params[:id])
          response.body = book.to_h.to_json
          response.format = :json
        end
      end
    end
  end
end
