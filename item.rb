class Item
    attr_reader :id, :publish_date, :label, :genre, :author, :archived

    def initialize(publish_date)
        @id = Random.rand(1...1000)
        @publish_date = Date.parse(publish_date)
    end
end