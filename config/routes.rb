# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    root { 'Hello from Hanami' }
    get '/books', to: 'books.index', as: :books
    get '/books/new', to: 'books.new'
    post '/books', to: 'books.create'
    delete '/books/:id', to: 'books.destroy'

    slice :api, at: '/api' do
      get '/books/:id', to: 'books.show'
    end
  end
end
