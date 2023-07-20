class Main
  def initialize
    user_interface
  end

  OPTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    10 => :exit_app
  }.freeze

  def user_interface
    show_all_choises
    puts 'enter your choise please:'
    choise = gets.chomp.to_i
    seclect_your_choise(choise)
    user_interface
  end

  def show_all_choises
    puts 'Welcome to our Ruby console app'
    puts 'Please choose an option from the given lists:'
    puts '================================'.center(40)
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '10. Exit'
  end

  def seclect_your_choise(choise)
    if OPTIONS.key?(choise)
      action = OPTIONS[choise]
      if action.is_a?(Proc)
        action.call
      else
        send(action)
      end
      exit if option == 10
    else

      puts 'Invalid choise, could try again please!'

    end
  end
end
Main.new
