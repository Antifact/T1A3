# how we store an item inside the Cart.items array.

class CartItem
    attr_accessor :item, :qty

    def initialize(item, qty)
            @item = item
            @qty = qty
    end
end