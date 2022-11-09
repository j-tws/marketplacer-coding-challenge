require_relative 'marketplace'
require 'json'

class App
  attr_reader :marketplace

  def initialize
    products_file = File.read('products.json')
    products = JSON.parse(products_file)
    @marketplace = Marketplace.new products
  end

  def menu 
    puts "Welcome to Marketplacer!"
    puts "The marketplace's list of products:"
    @marketplace.list_products
    puts "Please select an option to proceed:"
    puts "1. Add item to cart"
    puts "2. View cart"
    puts "3. Exit app"
    gets.chomp
  end

  def view_cart
    puts "Here is your cart:"
    @marketplace.list_cart
    puts "Your total is $#{@marketplace.cart_total}"
    
    if @marketplace.cart_total >= 20
      discount = @marketplace
        .discount
        .select { |key| key.include? @marketplace.cart_total }

      puts "Discount of #{100 - (100 * discount.values.last).to_i}% applied on total greater than $#{discount.keys.first.first}"

      puts "TOTAL after discount - $#{@marketplace.cart_total_after_discount.round(2)}"
    end

    puts "Please select an option to proceed:"
    puts "1. Remove item from cart"
    puts "2. Back to product list"
    gets.chomp
  end

  def add_item_to_cart_display
    puts "Welcome to Marketplacer!"
    puts "The marketplace's list of products:"
    @marketplace.list_products
    puts "Please enter item number to add into cart:"
    item = gets.chomp
    @marketplace.add_item(item.to_i)
  end

  def remove_item_from_cart_display
    puts "Here is your cart"
    @marketplace.list_cart

    puts "Please select an item to remove:"
    item = gets.chomp
    @marketplace.remove_item(item.to_i)
  end


  def start
    main_page = self.menu

    while main_page != '3'

      if main_page == "1"
        self.add_item_to_cart_display

      elsif main_page == "2"
        cart_page = self.view_cart

        if cart_page == "1"
          self.remove_item_from_cart_display
        end # cart_page == "1" aka removing item from cart

      end # main_page == "1"

      main_page = self.menu

    end # while loop
  end # start

end # class App

app = App.new
app.start
# puts app.marketplace.cart
# puts app.view_cart
