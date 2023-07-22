class Menu
  OPTIONS = {
    1 => :list_all_books,
    2 => :list_all_music_albums,
    3 => :list_all_games,
    4 => :list_all_genres,
    5 => :list_all_labels,
    6 => :list_all_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    0 => :exit_app
  }.freeze

  MENU_OPTIONS = [
    '•·.· Console App ·.·•',
    '︽︽︽︽︽︽︽︽︽︽︽︽',
    '1. List all books',
    '2. List all music albums',
    '3. List all games',
    '4. List all genres',
    '5. List all labels',
    '6. List all authors',
    '7. Add a book',
    '8. Add a music album',
    '9. Add a game',
    '0. Exit',
    '︾︾︾︾︾︾︾︾︾︾︾︾',
    'Enter your choice: '
  ].freeze

  def initialize(app)
    @app = app
  end

  def display
    puts MENU_OPTIONS.join("\n")
  end

  def process_choice(choice)
    action = OPTIONS[choice]
    if action
      @app.send(action)
    else
      puts 'Choice not valid. Please retry.'
    end
    choice != 0
  end
end
