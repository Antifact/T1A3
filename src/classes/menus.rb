def shopMenu
    clear
    puts ''
    prompt.select("What are we looking for?") do |menu|
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
  prompt.select("Your Cart") do |menu|
    menu.choice "P3 Choice 1"
    menu.choice "P3 Choice 2"
    menu.choice "P3 Choice 3"
  end
end