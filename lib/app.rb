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
    @marketplace.cart
    puts "Your total is $#{@marketplace.cart_total}"
    
    if @marketplace.cart_total > 20
      puts "You have discount applied"
    end

    puts "Please select an option to proceed:"
    puts "1. Remove item from cart"
    gets.chomp
  end

  def add_item_to_cart_display
    puts "Welcome to Marketplacer!"
    puts "The marketplace's list of products:"
    @marketplace.list_products
    puts "Please enter item number to add into cart:"
    item = gets.chomp
    self.marketplace.add_item(item.to_i)
  end

  # def remove_item_from_cart_display
  #   puts ""

  # def start
  #   mode = self.menu

  #   while mode != '3'

  #     if mode == "1"

  #     end

  #   end
  # end

end

app = App.new
app.add_item_to_cart_display
puts app.marketplace.cart
