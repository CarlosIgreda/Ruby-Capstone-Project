require 'date'

class Item
  attr_accessor :archived, :genre, :author

  def initialize(genre, author, publish_date, label, id: nil)
    @id = id || Random.rand(1...1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    @publish_date.year < (Date.today.year - 10)
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
