module Bookshelf
  module Persistence
    module Relations
      class Books < ROM::Relation[:sql]
        schema(:books, infer: true) do
        end
      end
    end
  end
end
