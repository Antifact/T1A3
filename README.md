# Grocery Shopping Application

Link to [repo](https://github.com/Antifact/ruby-terminal-app "GitHub Repository")

### Description

The purpose of this application is to create an easy-to-use shopping experience for users to purchase items from a shop. The target audience for this application are shoppers who would prefer to do their shopping online or quickly. Instead of having to deal with the new worry of social distancing in stores or having users struggle to navigate an online shop website, shoppers can use this application to cut straight to the point of their shopping experience. Users are able to add items to their cart, and checkout like they would in-store, but through a terminal application. 

### Functionality 

![first screen](docs/main.png)

When first running the application, the user is prompted with options to begin shopping, viewing their cart or exiting the program. 

![shopping screen](docs/shop.png)

When the user selects the "Shop" menu, they will be directed to a menu where there are categories of different items. This is used to make finding items much easier. They can choose a category and then be directed to the respected items.

![item menu](docs/shop_items.png)

Once in the category menu, the user will be shown the items. They can then choose an item to add to their cart.

![quantity menu](docs/quantity.png)

When a user selects an item, they will be prompted to specify how many of an item they'd like.

![quantity of items confirmation](docs/qty_confirm.png)

Once specified, the application will confirm that the amount was added to the cart. 

![cart](docs/cart.png)

The will be redirected to the shop, but once they are finished, they can navigate to their cart. The user is able to change the amount of an item that is in their cart if they need to.

![update quantity screen](docs/update_qty.png)

If the user needs to update the amount of items they have, then can select the item and specify the amount they need. 

![quantity updated success](docs/update_conf.png)

The user will then be shown a confirmation with the amount of the item that is now in their cart. 

![checkout screen](docs/checkout.png)

When the user is ready, they can check out. They will be given the total amount that their cart totals to and the application will end. 

![empty cart screen](docs/cart_empty.png)

If the user views their cart without shopping, they will be made aware that there is nothing in the cart and redirected to the shopping menu. They cannot check out if this is the case.

### Control Flow

![flowchart](docs/flowchart.png)
