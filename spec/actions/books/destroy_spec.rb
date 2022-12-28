# frozen_string_literal: true

RSpec.describe Bookshelf::Actions::Books::Destroy do
  subject(:action) do
    described_class.new(delete_book:)
  end

  let(:params) { { id: 1 } }
  let(:delete_book) { instance_double(Bookshelf::Operations::Books::Delete) }

  context 'when json is requested' do
    let(:params) { { id: 1, 'HTTP_ACCEPT' => 'application/json' } }

    it 'works' do
      expect(delete_book).to receive(:call).with(1).and_return(double(success?: true, value!: 1))
      response = action.call(params)
      expect(response).to be_successful
    end
  end

  context 'when json is not requested' do
    let(:params) { { id: 1, 'HTTP_ACCEPT' => 'application/html' } }

    it 'works' do
      expect(delete_book).to receive(:call).with(1).and_return(double(success?: true, value!: 1))

      status, headers, _body = action.call(params)

      expect(status).to eq(302)
      expect(headers['Location']).to eq('/books')
    end
  end
end
