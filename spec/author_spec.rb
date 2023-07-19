require './author'

RSpec.describe Author do
  author = Author.new('haftamu', 'desta')
  let(:item) { 'test item' }
  describe '#author' do
    it('returns instance of author object') do
      expect(author).to be_instance_of(Author)
    end
    it('returns first name correctly') do
      expect(author.first_name).to eql('haftamu')
    end
    it('returns last name correctly') do
      expect(author.last_name).to eql('desta')
    end
  end

  describe 'when receiving invalid arguments' do
    it 'raises an ArgumentError when not given two arguments' do
      expect { Author.new('haftamu') }.to raise_exception(ArgumentError)
    end
  end
  describe '#add_item ' do
    it 'add_item method updates the items' do
      author.add_item(item)
      expect(author.items).to eq([item])
    end
  end
end
