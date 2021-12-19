# all of the items and categories in the shop.

class Shop
    attr_accessor :items

    def initialize
        @items = {
            "fruit & veg" => [
                ShopItem.new("Apple", 0.99),
                ShopItem.new("Banana", 1.49),
                ShopItem.new("Orange", 0.79)
            ],
            "meat" => [
                ShopItem.new("Chicken", 4.99),
                ShopItem.new("Beef", 19.99),
                ShopItem.new("Pork", 14.99)
            ],
            "bakery" => [
                ShopItem.new("Bread", 3.49),
                ShopItem.new("Donut", 1.99)
            ],
            "dairy" => [
                ShopItem.new("Milk 3L", 3.99),
                ShopItem.new("Cheese", 4.99)
            ],
            "snacks" => [
                ShopItem.new("Chips", 3.00),
                ShopItem.new("Chocolate", 4.99)
            ],
            "freezer" => [
                ShopItem.new("Ice Cream", 4.99),
                ShopItem.new("Frozen Lasagne", 8.99),
                ShopItem.new("Peas", 2.99)
            ],
            "drinks" => [
                ShopItem.new("Cola 1.25L", 3.99),
                ShopItem.new("Lemonade 1.25L", 3.99)
            ]
        }
    end
end