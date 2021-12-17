def shopMenu
    clear
    puts ''
    prompt.select("What're we looking for?", cycle: true) do |menu|
      menu.choice "Fruit & Veg"
      menu.choice "Meat & Deli"
      menu.choice "Bakery"
      menu.choice "Dairy"
      menu.choice "Snacks"
      menu.choice "Freezer"
      menu.choice "Drinks"
      menu.choice "Return",->{firstMenu}
    end
end

def cart
  clear
  puts ''
  prompt.select("Your Cart", cycle: true) do |menu|
    menu.choice "View Cart"
    menu.choice "Edit Cart"
    menu.choice "Checkout"
    menu.choice "Return",->{firstMenu}
  end
end