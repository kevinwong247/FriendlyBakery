class Muffin < Pastry
    attr_accessor :name, :description, :price
    def initialize(name, description, price)
      super(name, description, price)
    end
end