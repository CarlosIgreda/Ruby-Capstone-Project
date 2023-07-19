require './genre'

RSpec.describe Genre do
  genres = Genre.new('haftamu')
  let(:item) { 'test item' }
  describe '#genre' do
    it('returns instance of Genre object') do
      expect(genres).to be_instance_of(Genre)
    end
    it('returns  name correctly') do
      expect(genres.name).to eql('haftamu')
    end
  end
  describe '#add_item ' do
    it 'add_item method updates the items' do
      genres.add_item(item)
      expect(genres.items).to eql([item])
    end
  end
end
