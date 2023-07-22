require_relative '../modules/author'

RSpec.describe Author do
  let(:author) { Author.new(1, 'Mario', 'Vargas') }

  describe '#initialize' do
    it 'sets id, first_name, and last_name' do
      expect(author.id).to eq(1)
      expect(author.first_name).to eq('Mario')
      expect(author.last_name).to eq('Vargas')
    end

    it 'sets items as an empty array' do
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('Item') }

    it 'adds the item to the items array' do
      author.add_item(item)
      expect(author.items).to contain_exactly(item)
    end
  end
end
