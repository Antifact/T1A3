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
    prompt.select("What do we need?", cycle:true) do |menu|
      category.each do |item|
        menu.choice item.name + " - $" + item.price.to_s,->{qty_menu(item)}
      end
    
      menu.choice "Return",->{shop_menu}
    end
 end

 def qty_menu(item)
  qty = prompt.ask("How many would you like? (1 - 9)") { |q| q.in("1-9") }

    @cart.items.each do |cart_item|
        if cart_item.item == item
          cart_item.qty = cart_item.qty.to_i + qty.to_i
          prompt.ask("updated " + cart_item.item.name + " quanitity by " + qty + ".\n\nPress enter to return.")

          shop_menu
        end
      end
      
    cartItem = CartItem.new(item, qty)
    @cart.items.push(cartItem)
    
    prompt.ask(qty + " " + item.name + "(s) added into cart. \n\nPress enter to return.")  
        
  shop_menu
 end

  def cart_menu
    clear
    puts
    prompt.select("--------- Your Cart ---------", cycle: true) do |menu|

      if @cart.items.empty?
        puts "You don't have anything in your cart yet!\n\n"
        menu.choice "Go Shopping",->{shop_menu}
      else 
        @cart.items.each do |item|
          menu.choice item.qty.to_s + "x " + item.item.name + " @ " + item.item.price.to_s + "ea",->{update_menu(item)}
        end
        
        menu.choice "Checkout",->{checkout}
        menu.choice "Return",->{main_menu}
      end
    end
  end

  def update_menu(item)
    clear
    puts
    puts "--------- Update Item ---------"
    update = prompt.ask("You currently have " + item.qty.to_s + " " + item.item.name + "(s).\nHow many, in total, would you like? (Enter 0 to remove).") { |q| q.in("0-9") }

     if update.to_i == 0
      @cart.items.delete(item)
      prompt.ask("Successfully removed " + item.item.name + "(s).")
      cart_menu

     else
      item.qty = update.to_i
      prompt.ask("Successfully changed number of " + item.item.name + "(s) to " + item.qty.to_s)
      cart_menu
     end
  end

  def checkout
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

    prompt.ask("enter to cont.")
    cart_menu
  end
end

main_menu = Menu.new
main_menu.main_menu