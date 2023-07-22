require_relative '../menu'

RSpec.describe Menu do
  let(:app) { double('App') }
  let(:menu) { Menu.new(app) }

  describe '#process_choice' do
    context 'whenever a valid option is chosen' do
      before do
        allow(app).to receive(:list_all_books)
      end

      it 'calls the respective method' do
        expect(app).to receive(:list_all_books)
        menu.process_choice(1)
      end

      it 'returns true' do
        expect(menu.process_choice(1)).to be true
      end
    end

    context 'whenever an invalid option is chosen' do
      it 'shows an error message' do
        expect { menu.process_choice(99) }.to output("Choice not valid. Please retry.\n").to_stdout
      end
    end
  end
end
