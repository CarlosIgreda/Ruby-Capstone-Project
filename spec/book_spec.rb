require_relative '../modules/book'

RSpec.describe Book do
  let(:book_data) do
    {
      title: 'Title',
      author: 'Author',
      genre: 'Genre',
      label: 'Label',
      publish_date: Date.today,
      publisher: 'Publisher',
      cover_state: 'good'
    }
  end

  let(:book) { Book.new(book_data) }

  describe '#can_be_archived?' do
    context 'whenever the cover_state is equal to "bad"' do
      it 'returns true' do
        test_class = Class.new(Book) do
          def can_be_archived?
            true
          end
        end

        allow(Book).to receive(:new).and_return(test_class.new(book_data.merge(cover_state: 'bad')))
        expect(book.can_be_archived?).to be true
      end
    end

    context 'whenever the parent method returns false and cover_state is not equal to "bad"' do
      it 'returns false' do
        test_class = Class.new(Book) do
          def can_be_archived?
            false
          end
        end

        allow(Book).to receive(:new).and_return(test_class.new(book_data))
        expect(book.can_be_archived?).to be false
      end
    end
  end
end
