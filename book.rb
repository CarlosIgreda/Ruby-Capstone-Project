require_relative 'item'

# Class for book creation
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    # Logic to know if the book can be archived, return true or false
  end
end
