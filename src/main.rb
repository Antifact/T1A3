# requirements
require 'tty-prompt'

class MainMenu
  attr_accessor :prompt

  def initialize
    @prompt = TTY::Prompt.new
  end

  def firstMenu
    system "clear"
    puts "--------- Grocery Shopping!! ---------"
    prompt.select("What would you like to do?:") do |menu|
      menu.choice "Shop",->{shopMenu}
      menu.choice "View Cart",->{cart}
      menu.choice "Quit", ->{exit}
    end
  end

  def shopMenu
    system "clear"
    prompt.select("Customer Management") do |menu|
      menu.choice "New Customer"
      menu.choice "Modify Customer"
      menu.choice "Delete Customer"
      menu.choice "Display Customers"
      menu.choice "Return"
    end
  end

  def cart
    system "clear"
    prompt.select("Paragraph 3") do |menu|
      menu.choice "P3 Choice 1"
      menu.choice "P3 Choice 2"
      menu.choice "P3 Choice 3"
    end
  end
end

main_menu = MainMenu.new
main_menu.firstMenu