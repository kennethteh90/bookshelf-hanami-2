require 'rom-repository'

module Bookshelf
  module Repositories
    class Repository < ROM::Repository::Root
      def self.new
        super(Hanami.app['persistence.rom'])
      end

      def all
        root.to_a
      end

      def first
        root.first
      end

      def last
        root.last
      end

      def create(attrs)
        root.changeset(:create, attrs).map(:add_timestamps).commit
      end

      def update(id, attrs)
        root.by_pk(id).changeset(:update, attrs).map(:touch).commit
      end

      def delete(id)
        root.by_pk(id).delete
      end

      def clear
        root.delete
      end

      def entity_class
        root.mapper.model
      end
    end
  end
end
