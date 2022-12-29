require_relative './repository'

module Bookshelf
  module Repositories
    class Books < Repository[:books]
      def find(id)
        root.by_pk(id).one!
      end
    end
  end
end
