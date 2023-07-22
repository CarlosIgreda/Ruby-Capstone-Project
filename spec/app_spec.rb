require 'rspec'
require_relative '../app'

RSpec.describe App do
  let(:app) { App.new }

  describe '#list_all_books' do
    context 'whenever no books are available' do
      it 'displays "No books yet."' do
        expect { app.list_all_books }.to output("No books yet.\n").to_stdout
      end
    end

    context 'whenever books are available' do
      it 'displays the list of books' do
        book = Book.new(title: 'Book 1', author: 'Author 1', genre: 'Genre 1', label: 'Label 1',
                        publish_date: '2020-05-24', publisher: 'Publisher 1', cover_state: 'New')
        app.books << book

        expected_output = <<~OUTPUT
          All Books:
          1. Title: Book 1, Author: Author 1
          Genre: Genre 1, Label: Label 1
          Publish Date: 2020-05-24, Publisher: Publisher 1, Cover State: New
        OUTPUT

        expect { app.list_all_books }.to output(expected_output).to_stdout
      end
    end
  end
end
