require_relative 'marketplace'
require 'json'
require 'pry'
require 'colorize'

class App
  attr_reader :marketplace

  def initialize
    products_file = File.read('products.json')
    products = JSON.parse(products_file)
    @marketplace = Marketplace.new products
  end

  def list_products
    @marketplace.products.each_with_index do |item, i|
      puts "#{i+1}. Item: #{item["name"]}, Price: #{item["price"]}" 
    end
  end

  def list_cart
    @marketplace.cart.each_with_index do |item, i|
      puts "#{i+1}. Item: #{item["name"]}, Price: $#{item["price"]}" 
    end
  end

  def menu 
    puts "Welcome to Marketplacer!"
    puts "The marketplace's list of products:"
    puts "----------------------------------------------"
    self.list_products
    puts "----------------------------------------------"
    puts "Please select an option to proceed (Enter number 1 - 3):"
    puts "1. Add item to cart"
    puts "2. View cart"
    puts "3. Exit app"
    gets.chomp
  end
  
  def view_cart
    puts "Here is your cart:"
    puts "----------------------------------------------"
    self.list_cart
    puts "----------------------------------------------"
    puts "Your total is $#{@marketplace.cart_total.round(2)}".yellow
    
    if @marketplace.cart_total >= 20
      discount = @marketplace.cart_total_after_discount

      puts "Discount of #{100 - (100 * discount["discount_rate"]).to_i}% applied on total greater than $#{discount["total_needed"]}"

      puts "TOTAL after discount - $#{discount["cart_total_after_discount"]}".yellow.bold
    end

    puts "Please select an option to proceed (Enter number 1 - 2):"
    puts "1. Remove item from cart"
    puts "2. Back to product list"
    gets.chomp

  end
  
  def add_item_to_cart_display
    puts "Welcome to Marketplacer!"
    puts "The marketplace's list of products:"
    puts "----------------------------------------------"
    self.list_products
    puts "----------------------------------------------"
    puts "Please enter item number to add into cart (Enter number 1-#{@marketplace.products.length}):"
    item = gets.chomp

    if item.to_i <= 0 || item.to_i > @marketplace.products.length
      puts "Please enter valid option".red.bold
      return
    end

    added_item = @marketplace.add_item(item.to_i)
    puts "Successfully added #{added_item["name"]} to cart".green.bold
  end
  
  def remove_item_from_cart_display
    puts "Here is your cart"
    puts "----------------------------------------------"
    self.list_cart
    puts "----------------------------------------------"
    puts "Please select an item to remove (Enter number #{@marketplace.cart.length <= 1 ? @marketplace.cart.length : "1 - #{@marketplace.cart.length}"}):"
    item = gets.chomp

    if item.to_i <= 0 || item.to_i > @marketplace.cart.length
      puts "Please enter valid option".red.bold
      return
    end

    removed_item = @marketplace.remove_item(item.to_i)
    puts "Successfully removed #{removed_item["name"]} from cart".green.bold
  end

  def run_command(input)

    case input
    when "1"
      self.add_item_to_cart_display
    when "2"
      cart_command = self.view_cart
      case cart_command
      when "1"
        self.remove_item_from_cart_display
      when "2"
        return
      else
        puts "Please select valid option".red.bold
      end
    when "3"
      puts "Pleasure doing business with you!".green.bold
    else
      puts "Please select valid option".red.bold
    end

  end

  def start
    menu_command = nil

    while menu_command != '3'

      menu_command = self.menu
      run_command(menu_command)
      
    end # while loop

  end # start

end # class App


