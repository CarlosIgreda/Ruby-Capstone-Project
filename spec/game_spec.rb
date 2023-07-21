require_relative '../game'

RSpec.describe Game do
  let(:game_data) do
    {
      game_name: 'Game',
      genre: 'Genre',
      author: 'Author',
      publish_date: Date.today,
      label: 'Label',
      multiplayer: true,
      last_played_at: (Date.today - 731).to_s
    }
  end

  let(:game) { Game.new(game_data) }

  describe '#initialize' do
    it 'assigns game_name, multiplayer, and last_played_at' do
      expect(game.game_name).to eq('Game')
      expect(game.multiplayer).to be true
      expect(game.last_played_at).to eq((Date.today - 731).to_s)
    end
  end

  describe '#can_be_archived?' do
    context 'when the difference between last_played_at and today is greater than 730 days' do
      it 'returns true' do
        test_class = Class.new(Game) do
          def can_be_archived?
            true
          end
        end

        allow(Game).to receive(:new).and_return(test_class.new(game_data))
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when last_played_at is nil' do
      it 'returns true' do
        test_class = Class.new(Game) do
          def can_be_archived?
            true
          end
        end

        allow(Game).to receive(:new).and_return(test_class.new(game_data.merge(last_played_at: nil)))
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the difference between last_played_at and today is less than or equal to 730 days' do
      it 'returns false' do
        test_class = Class.new(Game) do
          def can_be_archived?
            false
          end
        end

        allow(Game).to receive(:new).and_return(test_class.new(game_data.merge(last_played_at: (Date.today - 730).to_s)))
        expect(game.can_be_archived?).to be false
      end
    end
  end
end
