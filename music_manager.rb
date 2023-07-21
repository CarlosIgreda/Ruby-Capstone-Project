require './genre'
require './music_albem'
require 'date'

class AlbumManager
  attr_reader :music_albums, :genres

  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
  end

  def list_music_albums
    @music_albums.map { |album| puts "Genre: '#{album.genre.name}', Publish date: '#{album.publish_date}'" }
  end

  def list_genres
    @genres.each_with_index { |genre, index| puts " #{index + 1}) Name: '#{genre.name}'" }
  end

  def add_music_album
    puts "Please fill in the music album's data"
    genre_name = get_user_input('Genre: ').capitalize
    matching_genre = @genres.find { |genre| genre.name == genre_name }
    if matching_genre
      genre = matching_genre
    else
      genre = Genre.new(genre_name)
      @genres << genre
    end
    publish_date = get_user_input_date('Publish date (yyyy-mm-dd): ')
    on_spotify = get_user_input_bool('Is it on spotifiy? ')
    music_album = MusicAlbum.new(genre, publish_date, on_spotify) # Class, 'yyyy-mm-dd', true or false
    @music_albums << music_album
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end

  def get_user_input_date(prompt)
    input = get_user_input(prompt)

    begin
      date = Date.parse(input)
      raise ArgumentError unless date.strftime('%Y-%m-%d') == input

      input
    rescue ArgumentError, TypeError
      puts 'Invalid date format. Please enter a date in the format yyyy-mm-dd.'
      get_user_input_date(prompt)
    end
  end

  def get_user_input_bool(prompt)
    input = get_user_input(prompt).downcase

    case input
    when 'true', 'yes', 'y'
      true
    else
      false
    end
  end
end
