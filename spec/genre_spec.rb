require_relative '../modules/genre'

RSpec.describe Genre do
  let(:genre) { Genre.new(1, 'Science fiction') }

  describe '#initialize' do
    it 'sets id and name' do
      expect(genre.id).to eq(1)
      expect(genre.name).to eq('Science fiction')
    end

    it 'sets an empty items array' do
      expect(genre.items).to be_empty
    end
  end

  describe '#to_s' do
    it 'returns the genre name as a string' do
      expect(genre.to_s).to eq('Science fiction')
    end
  end
end
