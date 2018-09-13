class Cake < Pastry
    attr_accessor :name, :description, :price
    def initialize(name, description, price)
      super()
  end
end