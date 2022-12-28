RSpec.describe Bookshelf::Operations::Books::Delete do
  let(:book_repo) { Bookshelf::Repositories::Books.new }

  subject { described_class.new(books: book_repo).call(book_id) }

  context 'when book exists' do
    let!(:book) { book_repo.create(title: 'Refactoring', author: 'Martin Fowler') }
    let(:book_id) { book.id }

    it 'deletes a book' do
      expect {
        expect(subject).to be_success
      }.to change { book_repo.all.count }.by(-1)
    end
  end

  context 'when book does not exist' do
    let(:book_id) { 5 }

    it 'deletes a book' do
      expect {
        expect(subject).to be_failure
      }.not_to change { book_repo.all.count }
    end
  end
end
