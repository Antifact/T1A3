# requirements
require 'tty-prompt'
require_relative './classes/menus'
require_relative './classes/item'
require_relative './methods/stuff'


class MainMenu
  attr_accessor :prompt

  def initialize
    @prompt = TTY::Prompt.new
  end

  def firstMenu
    clear
    puts ''
    puts "--------- Grocery Shopping!! ---------"
    puts ''
    prompt.select("What would you like to do?:") do |menu|
      menu.choice "Shop",->{shopMenu}
      menu.choice "View Cart",->{cart}
      menu.choice "Quit", ->{exit}
    end
  end
end

main_menu = MainMenu.new
main_menu.firstMenu