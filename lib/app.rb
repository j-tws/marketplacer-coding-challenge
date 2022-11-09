require_relative 'marketplace'
require 'json'
require 'pry'

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
    puts "----------------------------------------------"
    @marketplace.list_products
    puts "----------------------------------------------"
    puts "Please select an option to proceed:"
    puts "1. Add item to cart"
    puts "2. View cart"
    puts "3. Exit app"
    gets.chomp
  end
  
  def view_cart
    puts "Here is your cart:"
    puts "----------------------------------------------"
    @marketplace.list_cart
    puts "----------------------------------------------"
    puts "Your total is $#{@marketplace.cart_total.round(2)}"
    
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
    puts "----------------------------------------------"
    @marketplace.list_products
    puts "----------------------------------------------"
    puts "Please enter item number to add into cart:"
    item = gets.chomp.to_i
    @marketplace.add_item(item)
  end
  
  def remove_item_from_cart_display
    puts "Here is your cart"
    puts "----------------------------------------------"
    @marketplace.list_cart
    puts "----------------------------------------------"

    puts "Please select an item to remove:"
    item = gets.chomp.to_i
    @marketplace.remove_item(item)
  end

  def run_command(input)

    if input == "1"
      self.add_item_to_cart_display
    elsif input == "2"
  
      cart_command = self.view_cart
      if cart_command == "1"
        self.remove_item_from_cart_display
      end # cart_page == "1" aka removing item from cart
  
    else 
      puts "Please select valid option"
    end # main_page == "1"
    
  end

  def start
    menu_command = nil

    while menu_command != '3'

      menu_command = self.menu
      run_command(menu_command)
      
    end # while loop
  end # start

end # class App

# binding.pry

