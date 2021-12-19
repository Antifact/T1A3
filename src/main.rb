# requirements. this enables the gem and other files needed to run the application.
require 'tty-prompt'
require_relative './classes/Shop'
require_relative './classes/ShopItem'
require_relative './classes/Cart'
require_relative './classes/CartItem'
require_relative './methods/Clear'

# the menu class. the entire program that contains the rest of the menus. 
class Menu
  attr_accessor :prompt

  def initialize # initialise the guys so we can shorthand reference them later 
    @prompt = TTY::Prompt.new
    @shop = Shop.new
    @cart = Cart.new
  end

  def main_menu # the first menu. 
    clear
    puts
    puts "--------- Grocery Shopping!! ---------"
    puts
    prompt.select("What would you like to do?:", cycle: true) do |menu| # tty-prompt gem for clean menus 
      menu.choice "Shop",->{shop_menu}
      menu.choice "View Cart",->{cart_menu}
      menu.choice "Quit", ->{exit}
    end
  end

  def shop_menu # hold the entirety of the shop.
    clear
    puts
    prompt.select("What're we looking for?", cycle: true) do |menu|
      
      @shop.items.each do |category, items| # loop to display each item.
        menu.choice category,->{category_menu(items)} # getting the selected category's items to display via the category_menu
      end
      
      menu.choice "Return",->{main_menu}
    end
  end

 def category_menu(category) # list actual items from the correct category
  clear
  puts
    prompt.select("What do we need?", cycle:true) do |menu|
      category.each do |item|
        menu.choice item.name + " - $" + item.price.to_s,->{qty_menu(item)} # print each item and price. convert price to string so we can display it.
      end
    
      menu.choice "Return",->{shop_menu}
    end
 end

 def qty_menu(item) # defining the quantity menu. 
  qty = prompt.ask("How many would you like? (1 - 9)") { |q| q.in("1-9") } # this allows the user to only select between 1-9 items. better and more realisitc this way.

    @cart.items.each do |cart_item|
        if cart_item.item == item                                                                                   # this checks to see if the selected item already exists
          cart_item.qty = cart_item.qty.to_i + qty.to_i                                                             # and if so, updates the item by however many the user
          prompt.ask("updated " + cart_item.item.name + " quanitity by " + qty + ".\n\nPress enter to return.")     # inputs.

          shop_menu
        end
      end
      
    cartItem = CartItem.new(item, qty)
    @cart.items.push(cartItem)
    
    prompt.ask(qty + " " + item.name + "(s) added into cart. \n\nPress enter to return.")  
        
  shop_menu
 end

  def cart_menu # displaying the cart. 
    clear
    puts
    prompt.select("--------- Your Cart ---------", cycle: true) do |menu|

      if @cart.items.empty?                                                     # checks to see if the cart is empty. if so, print a message and direct the user to the shop
        puts "You don't have anything in your cart yet!\n\n"                    # otherwise, display the items and price and allow the user to change them while also displaying
        menu.choice "Go Shopping",->{shop_menu}                                 # some other options for the menu.
      else 
        @cart.items.each do |item|
          menu.choice item.qty.to_s + "x " + item.item.name + " @ " + item.item.price.to_s + "ea",->{update_menu(item)}
        end
        
        menu.choice "Checkout",->{checkout}
        menu.choice "Return",->{main_menu}
      end
    end
  end

  def update_menu(item) # how to change quantities of items, if needed.
    clear
    puts
    puts "--------- Update Item ---------"
    update = prompt.ask("You currently have " + item.qty.to_s + " " + item.item.name + "(s).\nHow many, in total, would you like? (Enter 0 to remove).") { |q| q.in("0-9") }

     if update.to_i == 0 # remove item
      @cart.items.delete(item)
      prompt.ask("Successfully removed " + item.item.name + "(s).")
      cart_menu

     else
      item.qty = update.to_i
      prompt.ask("Successfully changed number of " + item.item.name + "(s) to " + item.qty.to_s)
      cart_menu
     end
  end

  def checkout # checkout screen
    each_total = []
    total = 0

    clear 
    puts
    puts "--------- Your Receipt :) ---------"

    @cart.items.each do |item|
      each_total << item.item.price.to_f * item.qty.to_f
    end

    @cart.items.each do |item|
      puts item.qty.to_s + "x " + item.item.name + " @ " + item.item.price.to_s + "ea"
    end

    total = each_total.reduce(:+)

    puts "\nThe cost the for the above items comes to $" + total.round(2).to_s + "!"
    puts "\nThank you for shopping with us!:)"
  end
end

main_menu = Menu.new
main_menu.main_menu