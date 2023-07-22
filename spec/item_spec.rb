require 'date'
require_relative '../modules/item'
require_relative '../modules/author'
require_relative '../modules/genre'
require_relative '../modules/label'

RSpec.describe Item do
  let(:genre) { Genre.new(1, 'Drama') }
  let(:author) { Author.new(1, 'Max', 'Finch') }
  let(:label) { Label.new('New') }
  let(:publish_date) { Date.new(2015, 5, 3) }

  describe '#initialize' do
    context 'whenever an author is given' do
      it 'generates or locates the author and includes the item within it' do
        expect(Author).to receive(:authors).and_return([author])
        expect(author).to receive(:add_item).with(kind_of(Item))

        Item.new(genre, 1, publish_date, label)
      end
    end

    context 'whenever a genre is given' do
      it 'generates or locates the genre and includes the item within it' do
        expect(Genre).to receive(:genres).and_return([genre])
        expect(genre).to receive(:add_item).with(kind_of(Item))

        Item.new('Drama', author, publish_date, label)
      end
    end

    context 'whenever a label is given' do
      it 'generates or locates the label and includes the item within it' do
        expect(Label).to receive(:labels).and_return([label])
        expect(label).to receive(:add_item).with(kind_of(Item))

        Item.new(genre, author, publish_date, 'New')
      end
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the item is eligible for archiving' do
      item = Item.new(genre, author, Date.today - (11 * 365), label)
      expect(item.can_be_archived?).to be true
    end

    it 'returns false if the item is not eligible for archiving' do
      item = Item.new(genre, author, Date.today - (9 * 365), label)
      expect(item.can_be_archived?).to be false
    end
  end

  describe '#move_to_archive' do
    it 'sets the archived flag based on can_be_archived?' do
      item = Item.new(genre, author, Date.today - (11 * 365), label)
      item.move_to_archive
      expect(item.archived).to be true

      item = Item.new(genre, author, Date.today - (9 * 365), label)
      item.move_to_archive
      expect(item.archived).to be false
    end
  end
end
