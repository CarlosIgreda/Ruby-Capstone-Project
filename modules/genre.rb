require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  @genres = []

  class << self
    attr_reader :genres
  end

  def initialize(id, name)
    @id = id || Random.rand(1...500)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def to_s
    name.to_s
  end
end
