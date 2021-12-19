# requirements
require 'tty-prompt'
require_relative './classes/Shop'
require_relative './classes/ShopItem'
require_relative './classes/Cart'
require_relative './classes/CartItem'
require_relative './methods/stuff'

class Menu
  attr_accessor :prompt

  def initialize
    @prompt = TTY::Prompt.new
    @shop = Shop.new
    @cart = Cart.new
  end

  def main_menu
    clear
    puts
    puts "--------- Grocery Shopping!! ---------"
    puts
    prompt.select("What would you like to do?:", cycle: true) do |menu|
      menu.choice "Shop",->{shop_menu}
      menu.choice "View Cart",->{cart_menu}
      menu.choice "Quit", ->{exit}
    end
  end

  def shop_menu
    clear
    puts
    prompt.select("What're we looking for?", cycle: true) do |menu|
      
      @shop.items.each do |category, items|
        menu.choice category,->{category_menu(items)}
      end
      
      menu.choice "Return",->{main_menu}
    end
  end

 def category_menu(category)
  clear
  puts
    prompt.select("What're we looking for?", cycle:true) do |menu|
      category.each do |item|
        menu.choice item.name + " - $" + item.price.to_s,->{qty_menu(item)}
      end
    
      menu.choice "Return",->{shop_menu}
    end
 end

 def qty_menu(item)
  qty = prompt.ask("How many would you like? (1-9)") { |q| q.in("1-9") }

  if @cart.items.empty? 
    cartItem = CartItem.new(item, qty)
    @cart.items.push(cartItem)

    prompt.ask(qty + " " + item.name + "(s) added into cart. \n\nPress enter to return.")

  else

    @cart.items.each do |cart_item|
      if cart_item.item == item
        cart_item.qty = cart_item.qty.to_i + qty.to_i

        prompt.ask("updated " + cart_item.item.name + " quanitity by " + qty + ".\n\nPress enter to return.")
      end
    end    
  end

  shop_menu
 end

  def cart_menu
    clear
    puts
    prompt.select("Your Cart", cycle: true) do |menu|
      @cart.items.each do |item|
        menu.choice item.qty.to_s + "x " + item.item.name + ": " + item.item.price.to_s
      end
      
      menu.choice "Checkout"
      menu.choice "Return",->{main_menu}
    end
  end
end
main_menu = Menu.new
main_menu.main_menu