# all of the items and categories in the shop.

class Shop
    attr_accessor :items

    def initialize
        @items = {
            "fruit & veg" => [
                ShopItem.new("Apple", 0.68),
                ShopItem.new("Banana", 0.63),
                ShopItem.new("Strawberries", 2.50),
                ShopItem.new("Watermelon", 7.70),
                ShopItem.new("Pineapple", 1.75),
                ShopItem.new("Orange", 1.95),
                ShopItem.new("Carrots", 1.00),
                ShopItem.new("Tomato", 1.09),
                ShopItem.new("Lettuce", 1.80)
            ],
            "meat" => [
                ShopItem.new("Chicken 2.25kg", 14.63),
                ShopItem.new("Beef Mince 500g", 9.00),
                ShopItem.new("Sausage 1.8kg", 11.00),
                ShopItem.new("Roast Pork Shoulder", 19.50)
            ],
            "bakery" => [
                ShopItem.new("Bread", 3.49),
                ShopItem.new("Anzac Biscuits", 6.00),
                ShopItem.new("Donuts 12pk", 3.00)
            ],
            "dairy" => [
                ShopItem.new("Milk 3L", 3.90),
                ShopItem.new("Butter", 4.50),
                ShopItem.new("Eggs", 4.50),
                ShopItem.new("Tasty Cheese", 5.30)
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
                ShopItem.new("Lemonade 1.25L", 3.99),
                ShopItem.new("Blue V", 4.00),
                ShopItem.new("Water 6 x 1.5L", 4.75)
            ]
        }
    end
end