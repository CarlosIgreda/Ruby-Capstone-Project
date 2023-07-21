require 'rspec'

# Define a shared example for the 'initialize' method
RSpec.shared_examples 'a new label' do |title, color|
  it 'creates a new label with title and color' do
    label = Label.new(title, color)

    expect(label.title).to eq(title)
    expect(label.color).to eq(color)
    expect(label.items).to be_empty
  end
end

describe Label do
  # Use the shared example with different scenarios for 'initialize'
  describe '#initialize' do
    include_examples 'a new label', 'Example Label', 'purple'
    include_examples 'a new label', 'Default Label', 'red'
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Label')
      item = double('Item')

      label.add_item(item)

      expect(label.items).to contain_exactly(item)
    end
  end
end
