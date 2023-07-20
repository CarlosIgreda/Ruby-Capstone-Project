class Label
  attr_reader :title, :color, :items, :id, :labels

  @labels = []

  class << self
    attr_reader :labels
  end

  def initialize(title, color = 'red')
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
