# how we store an item in the shop.

class ShopItem
    attr_accessor :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end
end